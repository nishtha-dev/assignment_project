import 'package:assignment_project/src/core/constants/endpoints.dart';
import 'package:assignment_project/src/core/dio/dio_client.dart';
import 'package:assignment_project/src/models/search_reponspe.dart';

abstract class GifRepository {
  const GifRepository();
  Future<List<SearchApiResponseData>> searchQuery(
      {required String searchQuery, int? offset});
  Future<List<SearchApiResponseData>> getTrendingGifData({int? offset});
}

class GifRepositoryImpl extends GifRepository {
  const GifRepositoryImpl({required this.client});
  final DioClient client;

  @override
  Future<List<SearchApiResponseData>> searchQuery(
      {required String searchQuery, int? offset}) async {
    try {
      final response = await client.dio.get(
          Endpoints.searchData(query: searchQuery, offset: offset.toString()));
      final model = SearchApiResponseData.listFromJson(response.data["data"]);
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SearchApiResponseData>> getTrendingGifData({int? offset}) async {
    try {
      final response = await client.dio
          .get(Endpoints.trendingData(offset: offset.toString()));
      final model = SearchApiResponseData.listFromJson(response.data["data"]);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
