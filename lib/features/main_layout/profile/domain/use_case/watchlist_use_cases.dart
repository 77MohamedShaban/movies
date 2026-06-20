import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import '../../../home/data/model/movie_response.dart';
import '../repo/watchlist_repo.dart';

@injectable
class AddToWatchlistUseCase {
  final WatchlistRepo _repository;
  AddToWatchlistUseCase(this._repository);

  Future<ApiResult<void>> call(int movieId) => _repository.addToWatchlist(movieId);
}

@injectable
class RemoveFromWatchlistUseCase {
  final WatchlistRepo _repository;
  RemoveFromWatchlistUseCase(this._repository);

  Future<ApiResult<void>> call(int movieId) => _repository.removeFromWatchlist(movieId);
}

@injectable
class GetWatchlistMoviesUseCase {
  final WatchlistRepo _repository;
  GetWatchlistMoviesUseCase(this._repository);

  Future<ApiResult<List<Movie>>> call() => _repository.getWatchlistMovies();
}

@injectable
class IsWatchlistedUseCase {
  final WatchlistRepo _repository;
  IsWatchlistedUseCase(this._repository);

  Future<ApiResult<bool>> call(int movieId) => _repository.isWatchlisted(movieId);
}
