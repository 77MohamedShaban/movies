import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart' as home_model;
import 'package:movies/features/movie_details/data/api/movie_details_client.dart';
import '../../domain/repo/history_repo.dart';
import '../data_source/history_dao.dart';

@Injectable(as: HistoryRepo)
class HistoryRepoImpl implements HistoryRepo {
  final HistoryDao _historyDao;
  final MovieDetailsClient _movieDetailsClient;

  HistoryRepoImpl(this._historyDao, this._movieDetailsClient);

  @override
  Future<ApiResult<void>> addToHistory(int movieId) async {
    try {
      await _historyDao.addToHistory(movieId);
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<List<home_model.Movie>>> getHistoryMovies() async {
    try {
      final ids = await _historyDao.getHistoryIds();
      List<home_model.Movie> movies = [];

      for (var id in ids) {
        final details = await _movieDetailsClient.getMovieDetails(id, false, false);
        final m = details.data?.movie;
        if (m != null) {
          movies.add(home_model.Movie(
            id: m.id,
            url: m.url,
            imdbCode: m.imdbCode,
            title: m.title,
            titleEnglish: m.titleEnglish,
            titleLong: m.titleLong,
            slug: m.slug,
            year: m.year,
            rating: m.rating,
            runtime: m.runtime,
            genres: m.genres,
            descriptionFull: m.descriptionFull,
            ytTrailerCode: m.ytTrailerCode,
            language: m.language,
            mpaRating: m.mpaRating,
            backgroundImage: m.backgroundImage,
            backgroundImageOriginal: m.backgroundImageOriginal,
            smallCoverImage: m.smallCoverImage,
            mediumCoverImage: m.mediumCoverImage,
            largeCoverImage: m.largeCoverImage,
            dateUploaded: m.dateUploaded,
            dateUploadedUnix: m.dateUploadedUnix,
          ));
        }
      }
      return Success(movies);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
