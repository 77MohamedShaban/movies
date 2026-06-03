import 'package:injectable/injectable.dart';
import 'package:movies/features/main_layout/browse/domain/repo/browse_repo.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../home/domain/entity/movie_entity.dart';

@injectable
class GetByGenreUseCase {
  final BrowseRepo _browseRepo;

  const GetByGenreUseCase(this._browseRepo);

  Future<ApiResult<MovieEntity>> call(String genre,int page) async {
    return await _browseRepo.fetchMoviesByGenre(genre,page);
  }
}
