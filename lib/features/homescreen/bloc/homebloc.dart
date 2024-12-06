import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelsapp/core/alerts/snackbarAlert.dart';
import 'package:pixelsapp/core/presentation/printString.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/features/homescreen/bloc/homeState.dart';
import 'package:pixelsapp/features/homescreen/models/photoGalleryModel.dart';
import 'package:pixelsapp/core/network/apis.dart';
import 'package:http/http.dart' as http;
import 'home_event.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static const String token =
      "dMFgx8f9lZqImn4jquFBOcEN4BhkxzntA8iujEsiBHIQyTLQk1CzE3rt";
  int currentPage = 1;
  bool hasMore = true;
  List<PhotoGalleryPhotos> photosList = [];

  HomeBloc() : super(HomeInitial()) {
    on<LoadInitialGallery>(_onLoadInitialGallery);
    on<LoadMoreGallery>(_onLoadMoreGallery);
    on<SelectImage>(_onSelectImage);
    on<DownloadImage>(_onDownloadImage);
  }

  Future<void> _onLoadInitialGallery(
      LoadInitialGallery event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    currentPage = 1;
    hasMore = true;
    photosList.clear();

    try {
      await _fetchGalleryData(currentPage);
      emit(HomeLoaded(photos: photosList, hasMore: hasMore));
    } catch (e) {
      emit(HomeError("Failed to load gallery."));
    }
  }

  Future<void> _onLoadMoreGallery(
      LoadMoreGallery event, Emitter<HomeState> emit) async {
    if (!hasMore) return;

    try {
      await _fetchGalleryData(currentPage + 1);
      emit(HomeLoaded(photos: photosList, hasMore: hasMore));
    } catch (e) {
      emit(HomeError("Failed to load more images."));
    }
  }

  Future<void> _onSelectImage(
      SelectImage event, Emitter<HomeState> emit) async {
    final selectedImage = photosList[event.index];
    final imageUrl = selectedImage.src?.portrait ?? '';
    emit(HomeImageSelected(imageUrl)); // Emit the selected image URL state
  }

  Future<void> _onDownloadImage(
      DownloadImage event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      await _saveImageToGallery(event.imageUrl);
      emit(HomeLoaded(photos: photosList, hasMore: hasMore));
    } catch (e) {
      emit(HomeError("Failed to download image."));
    }
  }

  Future<void> _saveImageToGallery(String imageUrl) async {
    try {
      // final permissionStatus = await Permission.storage.request();
      // if (permissionStatus.isGranted) {
      // Fetch the image from the URL as bytes
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final result = await ImageGallerySaver.saveImage(
          response.bodyBytes,
          quality: 100,
        );

        if (result['isSuccess'] == true) {
          SnackBarAlert().basicSnackBar("Image saved to gallery!");
          PrintString('Image saved to gallery!');
          pop();
        } else {
          throw Exception('Failed to save image');
        }
      } else {
        throw Exception('Failed to load image from URL');
      }
      // } else {
      //   throw Exception('Storage permission denied');
      // }
    } catch (e) {
      PrintString('Error saving image: $e');
      rethrow;
    }
  }

  Future<void> _fetchGalleryData(int page) async {
    final url = Apis.getGalleryUrl(page: page);
    final headers = {"Authorization": token};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final data = photoGalleryModelFromJson(response.body);
      final newPhotos = data.photos ?? [];

      if (newPhotos.isEmpty) {
        hasMore = false;
      } else {
        photosList.addAll(newPhotos);
        currentPage = page;
      }
    } else {
      throw Exception("Failed to load data");
    }
  }
}
