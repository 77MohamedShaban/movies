import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/main_layout/browse/domain/use_case/get_by_genre_use_case.dart';
import 'package:movies/features/main_layout/home/domain/entity/movie_entity.dart';
import '../../../home/data/model/movie_response.dart';

import '../../../../../core/resources/api_result.dart';

part 'browse_state.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final GetByGenreUseCase _getByGenreUseCase;
  BrowseCubit(this._getByGenreUseCase) : super(BrowseInitial());

  int _currentPage = 1;
  final List<Movie> _allMovies = [];
  bool _isFetchingMore = false;
  bool _hasMoreData = true;

  Future<void> fetchMoviesByGenre(String genre, {bool isLoadMore = false}) async {
    if (isLoadMore) {
      if (_isFetchingMore || !_hasMoreData) return;
      _isFetchingMore = true;
    } else {
      _currentPage = 1;
      _allMovies.clear();
      _hasMoreData = true;
      _isFetchingMore = false;
      emit(MoviesByGenreLoading());
    }

    final result = await _getByGenreUseCase(genre, _currentPage);

    switch (result) {
      case Success<MovieEntity>():
        {
          final newMovies = result.response.movies?.whereType<Movie>().toList() ?? [];
          
          if (newMovies.isEmpty) {
            _hasMoreData = false;
          } else {
            _allMovies.addAll(newMovies);
            _currentPage++;
          }
          
          _isFetchingMore = false;
          emit(MoviesByGenreSuccess(MovieEntity(List.from(_allMovies))));
        }
      case Failure<MovieEntity>():
        {
          _isFetchingMore = false;
          if (_allMovies.isEmpty) {
            emit(MoviesByGenreFailure(result.message));
          }
        }
    }
  }
}
