import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/search_response.dart';

part 'search_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://movies-api.accel.li')
abstract class SearchClient {
  @factoryMethod
  factory SearchClient(Dio dio) = _SearchClient;

  @GET('/api/v2/list_movies.json')
  Future<SearchResponse> searchMovie(
    @Query('query_term') String q,
    @Query('page') int page,
  );
}
