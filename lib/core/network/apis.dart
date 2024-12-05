class Apis {
  static const String baseUrl = "https://api.pexels.com/v1";

  // Dynamic gallery API URL that includes query and pagination
  static String getGalleryUrl({int page = 1, int perPage = 20}) {
    return "$baseUrl/search?query=cars&page=$page&per_page=$perPage";
  }

  static String getCuratedUrl({int page = 1, int perPage = 20}) {
    return "$baseUrl/curated?page=$page&per_page=$perPage";
  }

//image preview
}
