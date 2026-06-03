import 'package:movies/features/main_layout/home/domain/entity/movie_entity.dart';
import '../../../../../core/resources/api_result.dart';

abstract interface class BrowseRepo {
  Future<ApiResult<MovieEntity>> fetchMoviesByGenre(String genre,int page);
}
