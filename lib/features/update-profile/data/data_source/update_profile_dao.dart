
import '../../../auth/data/model/user_model.dart';

abstract interface class UpdateProfileDao {
  Future<void> updateUserData(UserModel user);
  Future<void> deleteUserAccount(String uid);
}
