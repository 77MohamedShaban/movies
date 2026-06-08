import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../../../core/resources/internet_checker.dart';
import '../../../../auth/domain/entity/user_entity.dart';
import '../../domain/repo/profile_repo.dart';
import '../data_source/profile_dao.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileDao profileDao;

  ProfileRepoImpl(this.profileDao);

  @override
  Future<ApiResult<UserEntity>> getUserData(String uid) async {
    try {
      bool hasInternet = await InternetChecker.checkConnection();
      if (!hasInternet) {
        return Failure("No Internet Connection");
      }

      final userModel = await profileDao.getUserData(uid);
      if (userModel != null) {
        return Success(UserEntity(
          uid: userModel.id,
          email: userModel.email,
          name: userModel.name,
          phone: userModel.phone,
          avatarId: userModel.avatarId,
        ));
      } else {
        return Failure("User not found");
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
