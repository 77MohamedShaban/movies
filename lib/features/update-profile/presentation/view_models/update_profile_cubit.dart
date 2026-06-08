import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../../core/di/di.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../../main_layout/profile/presentation/view_models/profile_cubit.dart';
import '../../domain/use_case/delete_user_account_use_case.dart';
import '../../domain/use_case/update_user_data_use_case.dart';

part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateUserDataUseCase _updateUserDataUseCase;
  final DeleteUserAccountUseCase _deleteUserAccountUseCase;

  UpdateProfileCubit(
    this._updateUserDataUseCase,
    this._deleteUserAccountUseCase,
  ) : super(UpdateProfileInitial());

  Future<void> updateProfile({
    required String uid,
    required String name,
    required String phone,
    required String avatarId,
    required String email,
  }) async {
    emit(UpdateProfileLoading());
    final user = UserEntity(
      uid: uid,
      name: name,
      phone: phone,
      avatarId: avatarId,
      email: email,
    );
    final result = await _updateUserDataUseCase.call(user);
    switch (result) {
      case Success<String>():{
        emit(UpdateProfileSuccess(result.response));
      }
      case Failure<String>():
        emit(UpdateProfileError(result.message));
    }
  }

  Future<void> deleteAccount(String uid) async {
    emit(DeleteAccountLoading());
    final result = await _deleteUserAccountUseCase.call(uid);
    switch (result) {
      case Success<String>():
        emit(DeleteAccountSuccess(result.response));
      case Failure<String>():
        emit(DeleteAccountError(result.message));
    }
  }
}
