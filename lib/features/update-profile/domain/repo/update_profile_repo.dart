import '../../../../../core/resources/api_result.dart';
import '../../../auth/domain/entity/user_entity.dart';

abstract interface class UpdateProfileRepo {
  Future<ApiResult<String>> updateUserData(UserEntity user);
  Future<ApiResult<String>> deleteUserAccount(String uid);
}
