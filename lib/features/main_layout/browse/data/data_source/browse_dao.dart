import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';

abstract interface class BrowseDao {
Future<ApiResult<MovieResponse>> fetchMoviesByGenre(String genre,int page);
}