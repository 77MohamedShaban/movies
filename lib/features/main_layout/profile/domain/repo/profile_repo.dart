import '../../../../../core/resources/api_result.dart';
import '../../../../auth/domain/entity/user_entity.dart';

abstract interface class ProfileRepo {
  Future<ApiResult<UserEntity>> getUserData(String uid);
}
