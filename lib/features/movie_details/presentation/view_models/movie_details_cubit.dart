import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/resources/api_result.dart';

import '../../domain/entity/movie_details_entity.dart';
import '../../domain/entity/similar_movies_entity.dart';
import '../../domain/use_case/get_movie_details_use_case.dart';
import '../../domain/use_case/get_similar_movies_use_case.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;

  MovieDetailsCubit(this._getMovieDetailsUseCase, this._getSimilarMoviesUseCase)
    : super(MovieDetailsInitial());

  Future<void> getMovieDetails(int id, bool withImages, bool withCast) async {
    emit(MovieDetailsLoading());
    final result = await _getMovieDetailsUseCase.call(id, withImages, withCast);
    switch (result) {
      case Success<MovieDetailsEntity>():
        {
          emit(MovieDetailsSuccess(result.response));
        }
      case Failure<MovieDetailsEntity>():
        {
          emit(MovieDetailsFailure(result.message));
        }
    }
    emit(SimilarMoviesLoading());
    final similarResult = await _getSimilarMoviesUseCase.call(id);
    switch (similarResult) {
      case Success<SimilarMoviesEntity>():
        return emit(SimilarMoviesSuccess(similarResult.response));
      case Failure<SimilarMoviesEntity>():
        return emit(SimilarMoviesFailure(similarResult.message));
    }
  }
}
