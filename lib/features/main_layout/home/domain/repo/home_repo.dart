import 'package:movies/features/main_layout/home/domain/entity/movie_entity.dart';
import '../../../../../core/resources/api_result.dart';

abstract interface class HomeRepo {
  Future<ApiResult<MovieEntity>> fetchMovies(int page);
  Future<ApiResult<MovieEntity>> fetchMoviesByGenre(String genre);

}
