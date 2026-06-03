part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class MoviesSuccessState extends HomeState {
  final MovieEntity data;
  MoviesSuccessState(this.data);
}
final class MoviesLoadingState extends HomeState {}
final class MoviesErrorState extends HomeState {
  final String message;
  MoviesErrorState(this.message);
}

final class MoviesGenresSuccessState extends HomeState {
  final MovieEntity data;
  MoviesGenresSuccessState(this.data);
}
final class MoviesGenresLoadingState extends HomeState {}
final class MoviesGenresErrorState extends HomeState {
  final String message;
  MoviesGenresErrorState(this.message);
}
