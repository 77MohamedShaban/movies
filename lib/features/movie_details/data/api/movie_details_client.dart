import 'package:injectable/injectable.dart';
import 'package:movies/features/movie_details/data/model/movie_details_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/similar_movies_response.dart';

part 'movie_details_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://movies-api.accel.li')
abstract class MovieDetailsClient {
  @factoryMethod
  factory MovieDetailsClient(Dio dio) = _MovieDetailsClient;

  @GET('/api/v2/movie_details.json')
  Future<MovieDetailsModel> getMovieDetails(
    @Query('movie_id') int id,
    @Query('with_images') bool withImages,
    @Query('with_cast') bool withCast,
  );

  @GET('/api/v2/movie_suggestions.json')
  Future<SimilarMoviesResponse> getSimilarMovies(@Query('movie_id') int id);
}
