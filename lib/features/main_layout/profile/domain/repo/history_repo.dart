import '../../../../../core/resources/api_result.dart';
import '../../../home/data/model/movie_response.dart';

abstract interface class HistoryRepo {
  Future<ApiResult<void>> addToHistory(int movieId);
  Future<ApiResult<List<Movie>>> getHistoryMovies();
}
