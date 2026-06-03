import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/api/home_client.dart';
import 'package:movies/features/main_layout/home/data/data_source/home_dao.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:dio/dio.dart';

@Injectable(as: HomeDao)
class HomeDaoImpl implements HomeDao {
  final HomeClient _homeClient;

  HomeDaoImpl(this._homeClient);

  @override
  Future<ApiResult<MovieResponse>> fetchMovies(int page) async {
    try {
      final response = await _homeClient.fetchMovies(page);
      if (response.error == null) {
        return Success(response);
      } else {
        return Failure(response.error??"Something went wrong");
      }
    } on DioException catch (e) {
      print(e.toString());
      return Failure("Server Error");
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<MovieResponse>> fetchMoviesByGenre(String genre) async{
    try {
      final response = await _homeClient.fetchMoviesByGenre(genre);
      if (response.error == null) {
        return Success(response);
      } else {
        return Failure(response.error??"Something went wrong");
      }
    } on DioException catch (e) {
      print(e.toString());
      return Failure("Server Error");
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
