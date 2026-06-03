import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/domain/use_case/login_use_case.dart';
import 'package:movies/features/auth/domain/use_case/sign_in_with_google_use_case.dart';
import 'package:movies/features/auth/presentation/view_models/log_in/log_in_states.dart';
import '../../../../../core/resources/api_result.dart';

@injectable
class LogInCubit extends Cubit<LogInState> {
  final LoginUseCase loginUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  LogInCubit(this.loginUseCase, this.signInWithGoogleUseCase)
      : super(LogInInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LogInLoading());

    final result = await loginUseCase(
      email: email,
      password: password,
    );

    switch (result) {
      case Success():
        emit(LogInSuccess());

      case Failure():
        emit(LogInError(result.message));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LogInGoogleLoading());

    final result = await signInWithGoogleUseCase();

    switch (result) {
      case Success():
        emit(LogInSuccess());

      case Failure():
        emit(LogInError(result.message));
    }
  }
}
