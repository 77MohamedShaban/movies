import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/resources/api_result.dart';
import 'package:movies/features/main_layout/home/domain/entity/movie_entity.dart';
import '../../data/model/movie_response.dart';
import '../../domain/use_case/get_by_genre_use_case.dart';
import '../../domain/use_case/get_movies_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase _getMoviesUseCase;
  final GetByGenreUseCase _getMoviesByGenreUseCase;

  HomeCubit(this._getMoviesUseCase, this._getMoviesByGenreUseCase)
    : super(HomeInitial()) {
    fetchMovies();
    fetchMoviesByGenre("Action");
  }

  int currentPage = 1;
  List<Movie> allMovies = [];
  bool isFetchingMore = false;

  Future<void> fetchMovies() async {
    if (isFetchingMore) return;

    if (currentPage == 1) {
      emit(MoviesLoadingState());
    } else {
      isFetchingMore = true;
    }

    final result = await _getMoviesUseCase(currentPage);

    switch (result) {
      case Success<MovieEntity>():
        final newMovies = result.response.movies.whereType<Movie>().toList();
        allMovies.addAll(newMovies);
        currentPage++;
        isFetchingMore = false;
        emit(MoviesSuccessState(MovieEntity(allMovies)));

      case Failure<MovieEntity>():
        isFetchingMore = false;
        if (allMovies.isEmpty) {
          emit(MoviesErrorState(result.message));
        }
    }
  }

  Future<void> fetchMoviesByGenre(String genre) async {
    emit(MoviesGenresLoadingState());
    final result = await _getMoviesByGenreUseCase(genre);
    switch (result) {
      case Success<MovieEntity>():
        emit(MoviesGenresSuccessState(result.response));
      case Failure<MovieEntity>():
        emit(MoviesGenresErrorState(result.message));
    }
  }
}
