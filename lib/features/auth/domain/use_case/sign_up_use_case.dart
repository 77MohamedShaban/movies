import 'package:injectable/injectable.dart';
import '../../../../core/resources/api_result.dart';
import '../entity/user_entity.dart';
import '../repo/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepo repository;

  SignUpUseCase(this.repository);

  Future<ApiResult<UserEntity>> call({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatarId,
  }) {
    return repository.signUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
      avatarId: avatarId,
    );
  }
}
