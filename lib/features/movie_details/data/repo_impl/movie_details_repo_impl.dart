import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/movie_details/data/model/movie_details_model.dart';
import 'package:movies/features/movie_details/data/model/similar_movies_response.dart';
import 'package:movies/features/movie_details/domain/entity/movie_details_entity.dart';
import 'package:movies/features/movie_details/domain/entity/similar_movies_entity.dart';
import '../../../../../core/resources/internet_checker.dart';
import '../../domain/repo/movie_details_repo.dart';
import '../data_source/movie_details_dao.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsDao _movieDetailsDao;

  const MovieDetailsRepoImpl(this._movieDetailsDao);

  @override
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(
      int id,
      bool withImages,
      bool withCast,
  ) async {
    bool conncted = await InternetChecker.checkConnection();

    if (conncted) {
      final result = await _movieDetailsDao.getMovieDetails(
        id,
        withImages,
        withCast,
      );
      switch (result) {
        case Success<MovieDetailsModel>():
          return Success(result.response.toEntity());
        case Failure<MovieDetailsModel>():
          return Failure(result.message);
      }
    } else {
      return Failure("No internet connection");
    }
  }

  @override
  Future<ApiResult<SimilarMoviesEntity>> getSimilarMovies(int id) async{
    bool conncted = await InternetChecker.checkConnection();

    if (conncted) {
      final result = await _movieDetailsDao.getSimilarMovies(
        id,
      );
      switch (result) {
        case Success<SimilarMoviesResponse>():
          return Success(result.response.toEntity());
        case Failure<SimilarMoviesResponse>():
          return Failure(result.message);
      }
    } else {
      return Failure("No internet connection");
    }
  }
}
