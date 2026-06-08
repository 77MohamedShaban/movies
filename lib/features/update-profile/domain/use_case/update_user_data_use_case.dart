import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../repo/update_profile_repo.dart';

@injectable
class UpdateUserDataUseCase {
  final UpdateProfileRepo updateProfileRepo;

  UpdateUserDataUseCase(this.updateProfileRepo);

  Future<ApiResult<String>> call(UserEntity user) {
    return updateProfileRepo.updateUserData(user);
  }
}
