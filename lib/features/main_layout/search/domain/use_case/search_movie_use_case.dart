import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../entity/search_movie_entity.dart';
import '../repo/search_repo.dart';

@injectable
class SearchMovieUseCase {
  final SearchRepo _searchRepo;

  const SearchMovieUseCase(this._searchRepo);

  Future<ApiResult<SearchMovieEntity>> call(String q,int page) async {
    return await _searchRepo.searchMovie(q,page);
  }
}
