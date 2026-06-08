import 'package:injectable/injectable.dart';
import '../../../../../core/resources/api_result.dart';
import '../repo/update_profile_repo.dart';

@injectable
class DeleteUserAccountUseCase {
  final UpdateProfileRepo updateProfileRepo;

  DeleteUserAccountUseCase(this.updateProfileRepo);

  Future<ApiResult<String>> call(String uid) {
    return updateProfileRepo.deleteUserAccount(uid);
  }
}
