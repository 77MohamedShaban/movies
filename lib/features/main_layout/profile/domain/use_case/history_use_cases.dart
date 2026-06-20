import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import '../../../home/data/model/movie_response.dart';
import '../repo/history_repo.dart';

@injectable
class AddToHistoryUseCase {
  final HistoryRepo _repository;
  AddToHistoryUseCase(this._repository);

  Future<ApiResult<void>> call(int movieId) => _repository.addToHistory(movieId);
}

@injectable
class GetHistoryMoviesUseCase {
  final HistoryRepo _repository;
  GetHistoryMoviesUseCase(this._repository);

  Future<ApiResult<List<Movie>>> call() => _repository.getHistoryMovies();
}
