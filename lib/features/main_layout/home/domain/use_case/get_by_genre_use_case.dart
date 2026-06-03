import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/home/domain/repo/home_repo.dart';

import '../../../../../core/resources/api_result.dart';
import '../entity/movie_entity.dart';

@injectable
class GetByGenreUseCase {
  final HomeRepo _homeRepo;

  const GetByGenreUseCase(this._homeRepo);

  Future<ApiResult<MovieEntity>> call(String genre) async {
    return await _homeRepo.fetchMoviesByGenre(genre);
  }
}
