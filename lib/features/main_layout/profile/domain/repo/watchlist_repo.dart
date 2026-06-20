import '../../../../../core/resources/api_result.dart';
import '../../../home/data/model/movie_response.dart';

abstract interface class WatchlistRepo {
  Future<ApiResult<void>> addToWatchlist(int movieId);
  Future<ApiResult<void>> removeFromWatchlist(int movieId);
  Future<ApiResult<List<Movie>>> getWatchlistMovies();
  Future<ApiResult<bool>> isWatchlisted(int movieId);
}
