import '../../../../../core/resources/api_result.dart';
import '../entity/search_movie_entity.dart';

abstract interface class SearchRepo {
  Future<ApiResult<SearchMovieEntity>> searchMovie(String q,int page);
}
