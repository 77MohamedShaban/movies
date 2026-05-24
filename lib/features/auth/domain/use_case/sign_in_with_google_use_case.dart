import 'package:injectable/injectable.dart';
import '../../../../core/resources/api_result.dart';
import '../entity/user_entity.dart';
import '../repo/auth_repo.dart';

@injectable
class SignInWithGoogleUseCase {
  final AuthRepo repository;

  SignInWithGoogleUseCase(this.repository);

  Future<ApiResult<UserEntity>> call() {
    return repository.signInWithGoogle();
  }
}
