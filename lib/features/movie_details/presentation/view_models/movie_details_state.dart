part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;

  MovieDetailsSuccess(this.movieDetails);
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String message;
  MovieDetailsFailure(this.message);
}

final class SimilarMoviesLoading extends MovieDetailsState {}

final class SimilarMoviesSuccess extends MovieDetailsState {
  final SimilarMoviesEntity similarMovies;
  SimilarMoviesSuccess(this.similarMovies);
}

final class SimilarMoviesFailure extends MovieDetailsState {
  final String message;
  SimilarMoviesFailure(this.message);
}
