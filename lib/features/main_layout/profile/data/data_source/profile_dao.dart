import '../../../../auth/data/model/user_model.dart';

abstract interface class ProfileDao {
  Future<UserModel?> getUserData(String uid);
}
