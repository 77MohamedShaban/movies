import '../../../domain/entity/user_entity.dart';

sealed class SignUpStates {}

class AuthInitial extends SignUpStates {}

class AuthLoading extends SignUpStates {}

class AuthSuccess extends SignUpStates {
  final UserEntity user;
  AuthSuccess(this.user);
}

class AuthError extends SignUpStates {

  final String message;
  AuthError(this.message);
}