import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/home/domain/repo/home_repo.dart';

import '../../../../../core/resources/api_result.dart';
import '../entity/movie_entity.dart';

@injectable
class GetMoviesUseCase {
  final HomeRepo _homeRepo;

  const GetMoviesUseCase(this._homeRepo);

  Future<ApiResult<MovieEntity>> call(int page) async {
    return await _homeRepo.fetchMovies(page);
  }
}
