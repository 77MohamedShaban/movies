import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/browse/data/data_source/browse_dao.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:movies/features/main_layout/home/domain/entity/movie_entity.dart';
import '../../../../../core/resources/internet_checker.dart';
import '../../domain/repo/browse_repo.dart';

@Injectable(as: BrowseRepo)
class BrowseRepoImpl implements BrowseRepo {
  final BrowseDao _browseDao;

  const BrowseRepoImpl(this._browseDao);

  @override
  Future<ApiResult<MovieEntity>> fetchMoviesByGenre(String genre,int page) async{
    bool conncted = await InternetChecker.checkConnection();

    if (conncted) {
      final result = await _browseDao.fetchMoviesByGenre(genre,page);
      switch (result) {
        case Success<MovieResponse>():
          return Success(result.response.toEntity());
        case Failure<MovieResponse>():
          return Failure(result.message);
      }
    } else {
      return Failure("No internet connection");
    }
  }
}
