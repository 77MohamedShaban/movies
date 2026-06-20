import 'package:injectable/injectable.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:movies/features/movie_details/data/api/movie_details_client.dart';
import '../../domain/repo/watchlist_repo.dart';
import '../data_source/watchlist_dao.dart';

@Injectable(as: WatchlistRepo)
class WatchlistRepoImpl implements WatchlistRepo {
  final WatchlistDao _watchlistDao;
  final MovieDetailsClient _movieDetailsClient;

  WatchlistRepoImpl(this._watchlistDao, this._movieDetailsClient);

  @override
  Future<ApiResult<void>> addToWatchlist(int movieId) async {
    try {
      await _watchlistDao.addToWatchlist(movieId);
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<void>> removeFromWatchlist(int movieId) async {
    try {
      await _watchlistDao.removeFromWatchlist(movieId);
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<List<Movie>>> getWatchlistMovies() async {
    try {
      final ids = await _watchlistDao.getWatchlistIds();
      List<Movie> movies = [];

      for (var id in ids) {
        final details = await _movieDetailsClient.getMovieDetails(id, false, false);
        final m = details.data?.movie;
        if (m != null) {
          // القيام بعملية Mapping يدوياً لتحويل الكلاس من MovieDetailsModel إلى MovieResponse
          movies.add(Movie(
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

  @override
  Future<ApiResult<bool>> isWatchlisted(int movieId) async {
    try {
      final ids = await _watchlistDao.getWatchlistIds();
      return Success(ids.contains(movieId));
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
