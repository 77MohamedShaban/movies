import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/data_source/home_dao.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:movies/features/main_layout/home/domain/entity/movie_entity.dart';
import 'package:movies/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:movies/features/main_layout/search/data/model/search_response.dart';
import 'package:movies/features/main_layout/search/domain/entity/search_movie_entity.dart';
import '../../../../../core/resources/internet_checker.dart';
import '../../domain/repo/search_repo.dart';
import '../data_source/search_dao.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchDao _searchDao;

  const SearchRepoImpl(this._searchDao);


  @override
  Future<ApiResult<SearchMovieEntity>> searchMovie(String q,int page) async{
    bool conncted = await InternetChecker.checkConnection();

    if (conncted) {
      final result = await _searchDao.searchMovie(q,page);
      switch (result) {
        case Success<SearchResponse>():
          return Success(result.response.toEntity());
        case Failure<SearchResponse>():
          return Failure(result.message);
      }
    } else {
      return Failure("No internet connection");
    }
  }
}
