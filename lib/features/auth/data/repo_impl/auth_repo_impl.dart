import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/resources/api_result.dart';
import '../../../../core/resources/internet_checker.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/auth_remote_dao.dart';
import '../model/user_model.dart';

@Injectable(as: AuthRepo)
class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDao authRemoteDao;

  AuthRepositoryImpl(this.authRemoteDao);

  @override
  Future<ApiResult<UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatarId,
  }) async {
    try {
      bool hasInternet = await InternetChecker.checkConnection();

      if (!hasInternet) {
        return Failure("No Internet Connection");
      }

      final credential = await authRemoteDao.signUp(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        return Failure("User is null");
      }

      UserModel userModel = UserModel(
        id: user.uid,
        name: name,
        email: email,
        phone: phone,
        avatarId: avatarId,
      );

      await authRemoteDao.saveUser(userModel);

      return Success(
        UserEntity(
          uid: user.uid,
          email: user.email ?? "",
          name: name,
          phone: phone,
          avatarId: avatarId,
        ),
      );
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return Failure("Weak Password");
        case 'email-already-in-use':
          return Failure("Email already in use");
        case 'invalid-email':
          return Failure("Invalid Email");
        default:
          return Failure(e.message ?? "Something went wrong");
      }
    } catch (e) {
      return Failure("An unexpected error occurred: ${e.toString()}");
    }
  }

  @override
  Future<ApiResult<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      bool hasInternet = await InternetChecker.checkConnection();

      if (!hasInternet) {
        return Failure("No Internet Connection");
      }

      final credential = await authRemoteDao.login(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        return Failure("User is null");
      }

      return Success(
        UserEntity(uid: user.uid, email: user.email ?? "", name: ""),
      );
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
        case 'user-not-found':
        case 'wrong-password':
          return Failure("Invalid email or password.");
        case 'user-disabled':
          return Failure("This user account has been disabled.");
        default:
          return Failure(e.message ?? "Authentication failed");
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<UserEntity>> signInWithGoogle() async {
    try {
      bool hasInternet = await InternetChecker.checkConnection();
      if (!hasInternet) {
        return Failure("No Internet Connection");
      }

      final credential = await authRemoteDao.signInWithGoogle();
      final user = credential.user;

      if (user == null) {
        return Failure("Google Sign-In failed");
      }

      UserModel userModel = UserModel(
        id: user.uid,
        name: user.displayName ?? "",
        email: user.email ?? "",
        phone: user.phoneNumber ?? "",
        avatarId: "0", // Default avatar for google sign in
      );

      await authRemoteDao.saveUser(userModel);

      return Success(
        UserEntity(
          uid: user.uid,
          email: user.email ?? "",
          name: user.displayName ?? "",
          phone: user.phoneNumber ?? "",
          avatarId: "0",
        ),
      );
    } on FirebaseException catch (e) {
      return Failure(e.message ?? "Google Sign-In failed");
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<String>> forgotPassword(String email) async {
    try {
      bool hasInternet = await InternetChecker.checkConnection();
      if (!hasInternet) {
        return Failure("No Internet Connection");
      }

      await authRemoteDao.forgotPassword(email);

      return Success("Password reset link has been sent to your email.");
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return Failure("No user found with this email.");
        case 'invalid-email':
          return Failure("The email address is badly formatted.");
        case 'too-many-requests':
          return Failure("Too many requests. Please try again later.");
        default:
          return Failure(e.message ?? "Failed to send reset email");
      }
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
