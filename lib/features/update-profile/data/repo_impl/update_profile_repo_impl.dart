import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/domain/entity/user_entity.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../../../core/resources/internet_checker.dart';
import '../../../auth/data/model/user_model.dart';
import '../../domain/repo/update_profile_repo.dart';
import '../data_source/update_profile_dao.dart';

@Injectable(as: UpdateProfileRepo)
class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileDao updateProfileDao;

  UpdateProfileRepoImpl(this.updateProfileDao);

  @override
  Future<ApiResult<String>> updateUserData(UserEntity user) async {
    try {
      bool hasInternet = await InternetChecker.checkConnection();
      if (!hasInternet) {
        return Failure("No Internet Connection");
      }

      await updateProfileDao.updateUserData(UserModel(
        id: user.uid,
        name: user.name,
        email: user.email,
        phone: user.phone,
        avatarId: user.avatarId,
      ));
      return Success("User updated successfully");
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<String>> deleteUserAccount(String uid) async {
    try {
      bool hasInternet = await InternetChecker.checkConnection();
      if (!hasInternet) {
        return Failure("No Internet Connection");
      }

      await updateProfileDao.deleteUserAccount(uid);
      return Success("User deleted successfully");
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
