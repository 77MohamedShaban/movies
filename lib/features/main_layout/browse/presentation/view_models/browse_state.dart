part of 'browse_cubit.dart';

@immutable
sealed class BrowseState {}

final class BrowseInitial extends BrowseState {}
final class MoviesByGenreLoading extends BrowseState {}
final class MoviesByGenreSuccess extends BrowseState {
  final MovieEntity movieEntity;
  MoviesByGenreSuccess(this.movieEntity);
}
final class MoviesByGenreFailure extends BrowseState {
  final String message;
  MoviesByGenreFailure(this.message);
}
