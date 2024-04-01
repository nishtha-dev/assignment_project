import 'package:assignment_project/env/env.dart';

class Endpoints {
  static const String baseUrl = "https://api.giphy.com/v1";
  static String trendingData(
      {String? limit = '10',
      String? offset = '10',
      String? ratingType = 'g',
      String? bundleType = 'clips_grid_picker'}) {
    return "$baseUrl/gifs/trending?api_key=${Env.giphyKey}&limit=$limit&offset=$offset&rating=$ratingType&bundle=$bundleType";
  }

  static String searchData(
      {required String query,
      String? limit = '10',
      String? offset = '10',
      String? ratingType = 'g',
      String? languageType = 'en',
      String? bundleType = 'clips_grid_picker'}) {
    return "$baseUrl/gifs/search?api_key=${Env.giphyKey}&q=$query&limit=$limit&offset=$offset&rating=$ratingType&lang=$languageType&bundle=$bundleType";
  }
}
