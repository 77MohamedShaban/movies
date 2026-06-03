import 'package:injectable/injectable.dart';
import 'package:movies/features/movie_details/domain/repo/movie_details_repo.dart';
import '../../../../../core/resources/api_result.dart';
import '../entity/similar_movies_entity.dart';

@injectable
class GetSimilarMoviesUseCase {
  final MovieDetailsRepo _movieDetailsRepo;

  const GetSimilarMoviesUseCase(this._movieDetailsRepo);

  Future<ApiResult<SimilarMoviesEntity>> call(int id) async {
    return await _movieDetailsRepo.getSimilarMovies(id);
  }
}
