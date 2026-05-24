sealed class LogInState {}

class LogInInitial extends LogInState {}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {}

class LogInError extends LogInState {
  final String message;
  LogInError(this.message);
}
