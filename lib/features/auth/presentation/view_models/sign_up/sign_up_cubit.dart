import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/presentation/view_models/sign_up/sign_up_states.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../domain/use_case/sign_up_use_case.dart';

@injectable
class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(AuthInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatarId,
  }) async {
    emit(AuthLoading());

    final result = await signUpUseCase(
      name: name,
      email: email,
      password: password,
      phone: phone,
      avatarId: avatarId,
    );

    switch (result) {
      case Success():
        emit(AuthSuccess(result.response));

      case Failure():
        emit(AuthError(result.message));
    }
  }
}
