import 'dart:convert';

PhotoGalleryModel photoGalleryModelFromJson(String str) =>
    PhotoGalleryModel.fromJson(json.decode(str));

String photoGalleryModelToJson(PhotoGalleryModel data) =>
    json.encode(data.toJson());

class PhotoGalleryModel {
  int? page;
  int? perPage;
  List<PhotoGalleryPhotos>? photos;
  int? totalResults;
  String? nextPage;

  PhotoGalleryModel({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });

  factory PhotoGalleryModel.fromJson(Map<String, dynamic> json) =>
      PhotoGalleryModel(
        page: json["page"],
        perPage: json["per_page"],
        photos: json["photos"] != null
            ? List<PhotoGalleryPhotos>.from(
                json["photos"].map((x) => PhotoGalleryPhotos.fromJson(x)))
            : [],
        totalResults: json["total_results"],
        nextPage: json["next_page"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "photos": photos?.map((x) => x.toJson()).toList(),
        "total_results": totalResults,
        "next_page": nextPage,
      };
}

class PhotoGalleryPhotos {
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  String? avgColor;
  Src? src;
  bool? liked;
  String? alt;

  PhotoGalleryPhotos({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  factory PhotoGalleryPhotos.fromJson(Map<String, dynamic> json) =>
      PhotoGalleryPhotos(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: json["src"] != null ? Src.fromJson(json["src"]) : null,
        liked: json["liked"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src?.toJson(),
        "liked": liked,
        "alt": alt,
      };
}

class Src {
  String? original;
  String? large2X;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  Src({
    this.original,
    this.large2X,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
      };
}
