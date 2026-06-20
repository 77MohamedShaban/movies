import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../../auth/domain/entity/user_entity.dart';
import '../../domain/use_case/get_user_data_use_case.dart';
import '../../domain/use_case/watchlist_use_cases.dart';
import '../../domain/use_case/history_use_cases.dart';
import '../../../home/data/model/movie_response.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final GetWatchlistMoviesUseCase _getWatchlistMoviesUseCase;
  final GetHistoryMoviesUseCase _getHistoryMoviesUseCase;
  final FirebaseAuth _firebaseAuth;

  ProfileCubit(
    this._getUserDataUseCase,
    this._getWatchlistMoviesUseCase,
    this._getHistoryMoviesUseCase,
    this._firebaseAuth,
  ) : super(ProfileState()) {
    init();
  }

  void init() {
    getUserData();
    getWatchlistMovies();
    getHistoryMovies();
  }

  Future<void> getUserData() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final result = await _getUserDataUseCase.call(user.uid);
      switch (result) {
        case Success<UserEntity>():
          emit(state.copyWith(
            profileStatus: ProfileStatus.success,
            user: result.response,
          ));
        case Failure<UserEntity>():
          emit(state.copyWith(
            profileStatus: ProfileStatus.error,
            profileErrorMessage: result.message,
          ));
      }
    } else {
      emit(state.copyWith(
        profileStatus: ProfileStatus.error,
        profileErrorMessage: "User not logged in",
      ));
    }
  }

  Future<void> getWatchlistMovies() async {
    emit(state.copyWith(watchlistStatus: WatchlistStatus.loading));
    final result = await _getWatchlistMoviesUseCase.call();
    switch (result) {
      case Success<List<Movie>>():
        emit(state.copyWith(
          watchlistStatus: WatchlistStatus.success,
          watchlist: result.response,
        ));
      case Failure<List<Movie>>():
        emit(state.copyWith(
          watchlistStatus: WatchlistStatus.error,
          watchlistErrorMessage: result.message,
        ));
    }
  }

  Future<void> getHistoryMovies() async {
    emit(state.copyWith(historyStatus: HistoryStatus.loading));
    final result = await _getHistoryMoviesUseCase.call();
    switch (result) {
      case Success<List<Movie>>():
        emit(state.copyWith(
          historyStatus: HistoryStatus.success,
          history: result.response,
        ));
      case Failure<List<Movie>>():
        emit(state.copyWith(
          historyStatus: HistoryStatus.error,
          historyErrorMessage: result.message,
        ));
    }
  }
}
