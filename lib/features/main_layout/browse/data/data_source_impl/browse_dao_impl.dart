import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:dio/dio.dart';
import '../api/browse_client.dart';
import '../data_source/browse_dao.dart';

@Injectable(as: BrowseDao)
class BrowseDaoImpl implements BrowseDao {
  final BrowseClient _browseClient;

  BrowseDaoImpl(this._browseClient);

  @override
  Future<ApiResult<MovieResponse>> fetchMoviesByGenre(String genre,int page) async{
    try {
      final response = await _browseClient.fetchMoviesByGenre(genre,page);
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
