import 'package:injectable/injectable.dart';
import '../../../../core/resources/api_result.dart';
import '../repo/auth_repo.dart';

@injectable
class ForgetUseCase {
  final AuthRepo repository;

  ForgetUseCase(this.repository);

  Future<ApiResult<String>> call({
    required String email,
  }) {
    return repository.forgotPassword(email);
  }
}
