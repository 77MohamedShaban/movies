import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../home/data/model/movie_response.dart';

part 'browse_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://movies-api.accel.li')
abstract class BrowseClient {
  @factoryMethod
  factory BrowseClient(Dio dio) = _BrowseClient;

  @GET('/api/v2/list_movies.json')
  Future<MovieResponse> fetchMoviesByGenre(
    @Query('genre') String genre,
    @Query('page') int page,
  );
}
