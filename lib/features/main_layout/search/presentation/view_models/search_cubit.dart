import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';
import 'package:movies/features/main_layout/search/domain/use_case/search_movie_use_case.dart';

import '../../../../../core/resources/api_result.dart';
import '../../domain/entity/search_movie_entity.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchMovieUseCase _searchMovieUseCase;
  SearchCubit(this._searchMovieUseCase) : super(SearchInitial());

  int _currentPage = 1;
  String _currentQuery = "";
  final List<Movie> _allMovies = [];
  bool _isFetchingMore = false;
  bool _hasMoreData = true; // علامة للتوقف إذا انتهت البيانات من السيرفر

  Future<void> searchMovie(String q, {bool isLoadMore = false}) async {
    if (q.isEmpty) {
      _resetSearch();
      emit(SearchInitial());
      return;
    }

    // إذا كان بحثاً جديداً بكلمة مختلفة
    if (!isLoadMore || q != _currentQuery) {
      _resetSearch();
      _currentQuery = q;
      emit(SearchLoading());
    } else {
      // إذا كنا نحمل المزيد
      if (_isFetchingMore || !_hasMoreData) return;
      _isFetchingMore = true;
    }

    final result = await _searchMovieUseCase.call(q, _currentPage);

    switch (result) {
      case Success<SearchMovieEntity>():
        {
          final newMovies = result.response.movies;
          
          if (newMovies.isEmpty) {
            _hasMoreData = false;
            if (_currentPage == 1) {
              return emit(SearchFailure("Your search did not return any results"));
            }
          } else {
            _allMovies.addAll(newMovies);
            _currentPage++;
          }
          
          _isFetchingMore = false;
          return emit(SearchSuccess(SearchMovieEntity(List.from(_allMovies))));
        }
      case Failure<SearchMovieEntity>():
        {
          _isFetchingMore = false;
          // نظهر الخطأ فقط لو مفيش نتائج قديمة معروضة
          if (_allMovies.isEmpty) {
            return emit(SearchFailure(result.message));
          }
        }
    }
  }

  void _resetSearch() {
    _allMovies.clear();
    _currentPage = 1;
    _isFetchingMore = false;
    _hasMoreData = true;
  }
}
