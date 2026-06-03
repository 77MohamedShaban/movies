import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/api_result.dart';
import '../../../domain/use_case/forget_use_case.dart';

part 'forget_states.dart';

@injectable
class ForgetCubit extends Cubit<ForgetStates> {
  final ForgetUseCase _forgetUseCase;

  ForgetCubit(this._forgetUseCase) : super(ForgetInitial());

  Future<void> forget({
    required String email,
  }) async {
    emit(ForgetLoading());

    final result = await _forgetUseCase(email: email);

    switch (result) {
      case Success():
        emit(ForgetSuccess(result.response));
      case Failure():
        emit(ForgetError(result.message));
    }
  }
}
