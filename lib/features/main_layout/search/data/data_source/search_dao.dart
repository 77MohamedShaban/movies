import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/search/data/model/search_response.dart';

abstract interface class SearchDao {
Future<ApiResult<SearchResponse>> searchMovie(String q,int page);

}