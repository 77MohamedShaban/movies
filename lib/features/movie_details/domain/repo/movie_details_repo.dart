import '../../../../core/resources/api_result.dart';
import '../entity/movie_details_entity.dart';
import '../entity/similar_movies_entity.dart';

abstract interface class MovieDetailsRepo {
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(
    int id,
    bool withImages,
    bool withCast,
  );

  Future<ApiResult<SimilarMoviesEntity>> getSimilarMovies(int id);
}
