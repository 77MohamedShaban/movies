import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/api/home_client.dart';
import 'package:movies/features/main_layout/home/data/data_source/home_dao.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:dio/dio.dart';
import 'package:movies/features/main_layout/search/data/api/search_client.dart';
import 'package:movies/features/main_layout/search/data/model/search_response.dart';

import '../data_source/search_dao.dart';

@Injectable(as: SearchDao)
class SearchDaoImpl implements SearchDao {
  final SearchClient _searchClient;

  SearchDaoImpl(this._searchClient);

  @override
  Future<ApiResult<SearchResponse>> searchMovie(String q,int page) async {
    try {
      final response = await _searchClient.searchMovie(q,page);
      if (response.error == null) {
        return Success(response);
      } else {
        return Failure(response.error ?? "Something went wrong");
      }
    } on DioException catch (e) {
      print(e.toString());
      return Failure("Server Error");
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
