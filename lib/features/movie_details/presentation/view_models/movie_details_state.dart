part of 'movie_details_cubit.dart';

enum MovieDetailsStatus { initial, loading, success, error }
enum SimilarMoviesStatus { initial, loading, success, error }
enum WatchlistStatus { initial, loading, success, error }

class MovieDetailsState {
  final MovieDetailsStatus detailsStatus;
  final MovieDetailsEntity? movieDetails;
  final String? detailsError;

  final SimilarMoviesStatus similarStatus;
  final SimilarMoviesEntity? similarMovies;
  final String? similarError;

  final bool isWatchlisted;
  final WatchlistStatus watchlistStatus;
  final String? watchlistError;

  MovieDetailsState({
    this.detailsStatus = MovieDetailsStatus.initial,
    this.movieDetails,
    this.detailsError,
    this.similarStatus = SimilarMoviesStatus.initial,
    this.similarMovies,
    this.similarError,
    this.isWatchlisted = false,
    this.watchlistStatus = WatchlistStatus.initial,
    this.watchlistError,
  });

  MovieDetailsState copyWith({
    MovieDetailsStatus? detailsStatus,
    MovieDetailsEntity? movieDetails,
    String? detailsError,
    SimilarMoviesStatus? similarStatus,
    SimilarMoviesEntity? similarMovies,
    String? similarError,
    bool? isWatchlisted,
    WatchlistStatus? watchlistStatus,
    String? watchlistError,
  }) {
    return MovieDetailsState(
      detailsStatus: detailsStatus ?? this.detailsStatus,
      movieDetails: movieDetails ?? this.movieDetails,
      detailsError: detailsError ?? this.detailsError,
      similarStatus: similarStatus ?? this.similarStatus,
      similarMovies: similarMovies ?? this.similarMovies,
      similarError: similarError ?? this.similarError,
      isWatchlisted: isWatchlisted ?? this.isWatchlisted,
      watchlistStatus: watchlistStatus ?? this.watchlistStatus,
      watchlistError: watchlistError ?? this.watchlistError,
    );
  }
}
