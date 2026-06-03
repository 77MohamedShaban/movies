import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/movie_details/data/model/similar_movies_response.dart';
import '../api/movie_details_client.dart';
import '../data_source/movie_details_dao.dart';
import 'package:dio/dio.dart';

import '../model/movie_details_model.dart';

@Injectable(as: MovieDetailsDao)
class MovieDetailsDaoImpl implements MovieDetailsDao {
  final MovieDetailsClient _movieDetailsClient;

  MovieDetailsDaoImpl(this._movieDetailsClient);

  @override
  Future<ApiResult<MovieDetailsModel>> getMovieDetails(
    int id,
    bool withImages,
    bool withCast,
  ) async {
    try {
      final response = await _movieDetailsClient.getMovieDetails(
        id,
        withImages,
        withCast,
      );
      if (response.error == null) {
        return Success(response);
      } else {
        return Failure(response.error ?? "Something went wrong");
      }
    } on DioException catch (e) {
      print(e.toString());
      return Failure("Server Error");
    } catch (e,s) {
      print(s);
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<SimilarMoviesResponse>> getSimilarMovies(int id) async{
    try {
      final response = await _movieDetailsClient.getSimilarMovies(
        id,
      );
      if (response.error == null) {
        return Success(response);
      } else {
        return Failure(response.error ?? "Something went wrong");
      }
    } on DioException catch (e) {
      print(e.toString());
      return Failure("Server Error");
    } catch (e,s) {
      print(s);
      return Failure(e.toString());
    }
  }
}
