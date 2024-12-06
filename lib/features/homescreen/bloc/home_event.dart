abstract class HomeEvent {}

class LoadInitialGallery extends HomeEvent {}

class LoadMoreGallery extends HomeEvent {}

class SelectImage extends HomeEvent {
  final int index;
  SelectImage(this.index);
}

class DownloadImage extends HomeEvent {
  final String imageUrl;
  DownloadImage(this.imageUrl);
}
