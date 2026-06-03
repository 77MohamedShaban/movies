part of 'forget_cubit.dart';

@immutable
sealed class ForgetStates {}

final class ForgetInitial extends ForgetStates {}
final class ForgetLoading extends ForgetStates {}
final class ForgetSuccess extends ForgetStates {
  final String message;
  ForgetSuccess(this.message);
}
final class ForgetError extends ForgetStates {
  final String message;
  ForgetError(this.message);
}
