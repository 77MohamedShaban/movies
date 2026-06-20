part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, error }
enum WatchlistStatus { initial, loading, success, error }
enum HistoryStatus { initial, loading, success, error }

class ProfileState {
  final ProfileStatus profileStatus;
  final UserEntity? user;
  final String? profileErrorMessage;

  final WatchlistStatus watchlistStatus;
  final List<Movie> watchlist;
  final String? watchlistErrorMessage;

  final HistoryStatus historyStatus;
  final List<Movie> history;
  final String? historyErrorMessage;

  ProfileState({
    this.profileStatus = ProfileStatus.initial,
    this.user,
    this.profileErrorMessage,
    this.watchlistStatus = WatchlistStatus.initial,
    this.watchlist = const [],
    this.watchlistErrorMessage,
    this.historyStatus = HistoryStatus.initial,
    this.history = const [],
    this.historyErrorMessage,
  });

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    UserEntity? user,
    String? profileErrorMessage,
    WatchlistStatus? watchlistStatus,
    List<Movie>? watchlist,
    String? watchlistErrorMessage,
    HistoryStatus? historyStatus,
    List<Movie>? history,
    String? historyErrorMessage,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      user: user ?? this.user,
      profileErrorMessage: profileErrorMessage ?? this.profileErrorMessage,
      watchlistStatus: watchlistStatus ?? this.watchlistStatus,
      watchlist: watchlist ?? this.watchlist,
      watchlistErrorMessage: watchlistErrorMessage ?? this.watchlistErrorMessage,
      historyStatus: historyStatus ?? this.historyStatus,
      history: history ?? this.history,
      historyErrorMessage: historyErrorMessage ?? this.historyErrorMessage,
    );
  }
}
