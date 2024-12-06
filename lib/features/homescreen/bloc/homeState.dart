import 'package:equatable/equatable.dart';
import 'package:pixelsapp/features/homescreen/models/photoGalleryModel.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<PhotoGalleryPhotos> photos;
  final bool hasMore;

  HomeLoaded({required this.photos, required this.hasMore});

  @override
  List<Object?> get props => [photos, hasMore];
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

class HomeImageSelected extends HomeState {
  final String imageUrl;

  HomeImageSelected(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}
