import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/data_source/home_dao.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:movies/features/main_layout/home/domain/entity/movie_entity.dart';
import 'package:movies/features/main_layout/home/domain/repo/home_repo.dart';
import '../../../../../core/resources/internet_checker.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDao _homeDao;

  const HomeRepoImpl(this._homeDao);

  @override
  Future<ApiResult<MovieEntity>> fetchMovies(int page) async {
    bool conncted = await InternetChecker.checkConnection();

    if (conncted) {
      final result = await _homeDao.fetchMovies(page);
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

  @override
  Future<ApiResult<MovieEntity>> fetchMoviesByGenre(String genre) async{
    bool conncted = await InternetChecker.checkConnection();

    if (conncted) {
      final result = await _homeDao.fetchMoviesByGenre(genre);
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
