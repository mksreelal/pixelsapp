import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pixelsapp/core/alerts/snackbarAlert.dart';
import 'package:pixelsapp/core/network/apis.dart';
import 'package:pixelsapp/core/presentation/printString.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/core/route/routeName.dart';
import 'package:pixelsapp/features/homescreen/models/photoGalleryModel.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  bool loading = false;
  int currentPage = 1;
  bool hasMore = true;
  int photoSelecIndex = -1;
  List<PhotoGalleryPhotos> photosList = [];
  static const String token =
      "dMFgx8f9lZqImn4jquFBOcEN4BhkxzntA8iujEsiBHIQyTLQk1CzE3rt";

  // Set loading state
  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  // Fetch initial data
  Future<void> getHomeGallery() async {
    setLoading(true);
    currentPage = 1;
    photosList.clear();
    await _fetchGalleryData(currentPage);
    setLoading(false);
  }

  // Fetch more data for lazy loading
  Future<void> loadMoreGallery() async {
    if (!loading && hasMore) {
      setLoading(true);
      currentPage++;
      await _fetchGalleryData(currentPage);
      setLoading(false);
    }
  }

  // Fetch gallery data from the API
  Future<void> _fetchGalleryData(int page) async {
    final url = Apis.getGalleryUrl(page: page);
    final headers = {"Authorization": token};

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      PrintString("$url ${response.body} ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = photoGalleryModelFromJson(response.body);

        final Iterable<PhotoGalleryPhotos> newPhotos =
            data.photos?.reversed ?? [];

        if (newPhotos.isEmpty) {
          hasMore = false; // No more data to load
        } else {
          photosList.addAll(newPhotos); // Append new data to the list
        }
        notifyListeners();
      } else if (response.statusCode == 401) {
        SnackBarAlert().errorSnackBar("Unauthorized access.");
      } else {
        PrintString("Error: ${response.statusCode}");
        SnackBarAlert().errorSnackBar("Something Happened. Reload.");
      }
    } on SocketException {
      SnackBarAlert().errorSnackBar("No internet connection");
    } catch (e) {
      PrintString("Error: $e");
      SnackBarAlert().errorSnackBar("Something Happened.");
    }
  }

  //setimage
  setImage(int id) {
    photoSelecIndex = id;
    pushNamed(RouteName.imagePreview);
  }

  //
  Future<void> saveNetworkImageToGallery(String imageUrl) async {
    setLoading(true);
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.bodyBytes),
          name: 'image.jpg', // Optional custom name
        );
        SnackBarAlert().basicSnackBar("Image Saved to Gallery");
        setLoading(false);

        PrintString('Image saved to gallery: $result');
      } else {
        setLoading(false);

        PrintString('Failed to download image');
      }
    } catch (e) {
      setLoading(false);

      PrintString('Error saving image: $e');
    }
    setLoading(false);
  }
}
