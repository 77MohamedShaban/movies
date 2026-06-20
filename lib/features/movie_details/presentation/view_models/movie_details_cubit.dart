import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/resources/api_result.dart';

import '../../../main_layout/profile/domain/use_case/watchlist_use_cases.dart';
import '../../../main_layout/profile/domain/use_case/history_use_cases.dart';
import '../../domain/entity/movie_details_entity.dart';
import '../../domain/entity/similar_movies_entity.dart';
import '../../domain/use_case/get_movie_details_use_case.dart';
import '../../domain/use_case/get_similar_movies_use_case.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  final AddToWatchlistUseCase _addToWatchlistUseCase;
  final RemoveFromWatchlistUseCase _removeFromWatchlistUseCase;
  final IsWatchlistedUseCase _isWatchlistedUseCase;
  final AddToHistoryUseCase _addToHistoryUseCase;

  MovieDetailsCubit(
    this._getMovieDetailsUseCase,
    this._getSimilarMoviesUseCase,
    this._addToWatchlistUseCase,
    this._removeFromWatchlistUseCase,
    this._isWatchlistedUseCase,
    this._addToHistoryUseCase,
  ) : super(MovieDetailsState());

  Future<void> getMovieDetails(int id, bool withImages, bool withCast) async {
    emit(state.copyWith(detailsStatus: MovieDetailsStatus.loading));
    
    final result = await _getMovieDetailsUseCase.call(id, withImages, withCast);
    switch (result) {
      case Success<MovieDetailsEntity>():
        emit(state.copyWith(
          detailsStatus: MovieDetailsStatus.success,
          movieDetails: result.response,
        ));
      case Failure<MovieDetailsEntity>():
        emit(state.copyWith(
          detailsStatus: MovieDetailsStatus.error,
          detailsError: result.message,
        ));
    }
    
    // Check watchlist status
    checkWatchlistStatus(id);

    emit(state.copyWith(similarStatus: SimilarMoviesStatus.loading));
    final similarResult = await _getSimilarMoviesUseCase.call(id);
    switch (similarResult) {
      case Success<SimilarMoviesEntity>():
        emit(state.copyWith(
          similarStatus: SimilarMoviesStatus.success,
          similarMovies: similarResult.response,
        ));
      case Failure<SimilarMoviesEntity>():
        emit(state.copyWith(
          similarStatus: SimilarMoviesStatus.error,
          similarError: similarResult.message,
        ));
    }
  }

  Future<void> checkWatchlistStatus(int movieId) async {
    final result = await _isWatchlistedUseCase.call(movieId);
    if (result is Success<bool>) {
      emit(state.copyWith(isWatchlisted: result.response));
    }
  }

  Future<void> toggleWatchlist(int movieId) async {
    final bool currentlyInWatchlist = state.isWatchlisted;
    
    // Optimistic UI update
    emit(state.copyWith(isWatchlisted: !currentlyInWatchlist, watchlistStatus: WatchlistStatus.loading));

    ApiResult<void> result;
    if (currentlyInWatchlist) {
      result = await _removeFromWatchlistUseCase.call(movieId);
    } else {
      result = await _addToWatchlistUseCase.call(movieId);
    }

    if (result is Success<void>) {
      emit(state.copyWith(watchlistStatus: WatchlistStatus.success));
    } else if (result is Failure<void>) {
      // Revert if failed
      emit(state.copyWith(
        isWatchlisted: currentlyInWatchlist,
        watchlistStatus: WatchlistStatus.error,
        watchlistError: result.message,
      ));
    }
  }

  Future<void> addToHistory(int movieId) async {
    await _addToHistoryUseCase.call(movieId);
  }
}
