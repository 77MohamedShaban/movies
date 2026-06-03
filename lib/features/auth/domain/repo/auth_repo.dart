import '../../../../core/resources/api_result.dart';
import '../entity/user_entity.dart';

abstract interface class AuthRepo {
  Future<ApiResult<UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatarId,
  });

  Future<ApiResult<UserEntity>> login({
    required String email,
    required String password,
  });

  Future<ApiResult<UserEntity>> signInWithGoogle();

  Future<ApiResult<String>> forgotPassword(String email);
}
