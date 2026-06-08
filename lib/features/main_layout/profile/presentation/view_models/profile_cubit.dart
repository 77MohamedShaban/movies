import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../../auth/domain/entity/user_entity.dart';
import '../../domain/use_case/get_user_data_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final FirebaseAuth _firebaseAuth;

  ProfileCubit(this._getUserDataUseCase, this._firebaseAuth) : super(ProfileInitial()){
    getUserData();
  }


  Future<void> getUserData() async {
    emit(ProfileLoading());
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final result = await _getUserDataUseCase.call(user.uid);
      switch (result) {
        case Success<UserEntity>():
          emit(ProfileSuccess(result.response));
        case Failure<UserEntity>():
          emit(ProfileError(result.message));
      }
    } else {
      emit(ProfileError("User not logged in"));
    }
  }
}
