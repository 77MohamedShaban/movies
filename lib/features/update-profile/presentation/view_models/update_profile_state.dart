part of 'update_profile_cubit.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final String message;
  UpdateProfileSuccess(this.message);
}

class UpdateProfileError extends UpdateProfileState {
  final String message;
  UpdateProfileError(this.message);
}

class DeleteAccountLoading extends UpdateProfileState {}

class DeleteAccountSuccess extends UpdateProfileState {
  final String message;
  DeleteAccountSuccess(this.message);
}

class DeleteAccountError extends UpdateProfileState {
  final String message;
  DeleteAccountError(this.message);
}
