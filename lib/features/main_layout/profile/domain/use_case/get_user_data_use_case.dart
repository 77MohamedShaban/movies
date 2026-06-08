import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../../../../auth/domain/entity/user_entity.dart';
import '../repo/profile_repo.dart';

@injectable
class GetUserDataUseCase {
  final ProfileRepo profileRepo;

  GetUserDataUseCase(this.profileRepo);

  Future<ApiResult<UserEntity>> call(String uid) {
    return profileRepo.getUserData(uid);
  }
}
