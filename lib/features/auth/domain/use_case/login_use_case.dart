import 'package:injectable/injectable.dart';
import '../../../../core/resources/api_result.dart';
import '../entity/user_entity.dart';
import '../repo/auth_repo.dart';

@injectable
class LoginUseCase {
  final AuthRepo repository;

  LoginUseCase(this.repository);

  Future<ApiResult<UserEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}
