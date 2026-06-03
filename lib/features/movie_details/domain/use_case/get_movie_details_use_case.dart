import 'package:injectable/injectable.dart';
import 'package:movies/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movies/features/movie_details/domain/repo/movie_details_repo.dart';
import '../../../../../core/resources/api_result.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieDetailsRepo _movieDetailsRepo;

  const GetMovieDetailsUseCase(this._movieDetailsRepo);

  Future<ApiResult<MovieDetailsEntity>> call(
    int id,
    bool withImages,
    bool withCast,
  ) async {
    return await _movieDetailsRepo.getMovieDetails(id, withImages, withCast);
  }
}
