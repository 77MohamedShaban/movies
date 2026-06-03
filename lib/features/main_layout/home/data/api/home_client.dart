import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/movie_response.dart';

part 'home_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://movies-api.accel.li')
abstract class HomeClient {
  @factoryMethod
  factory HomeClient(Dio dio) = _HomeClient;

  @GET('/api/v2/list_movies.json')
  Future<MovieResponse> fetchMovies(@Query('page') int page);

  @GET('/api/v2/list_movies.json')
  Future<MovieResponse> fetchMoviesByGenre(@Query('genre') String genre);
}