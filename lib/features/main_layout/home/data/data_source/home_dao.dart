import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';

abstract interface class HomeDao {
Future<ApiResult<MovieResponse>> fetchMovies(int page);
Future<ApiResult<MovieResponse>> fetchMoviesByGenre(String genre);

}