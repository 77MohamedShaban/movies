import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:movies/features/movie_details/data/model/movie_details_model.dart';
import 'package:movies/features/movie_details/data/model/similar_movies_response.dart';

abstract interface class MovieDetailsDao {
  Future<ApiResult<MovieDetailsModel>> getMovieDetails(
    int id,
    bool withImages,
    bool withCast,
  );

  Future<ApiResult<SimilarMoviesResponse>> getSimilarMovies(int id);
}
