import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

abstract interface class AuthRemoteDao {
  Future<UserCredential> signUp({
    required String email,
    required String password,
  });

  Future<UserCredential> login({
    required String email,
    required String password,
  });

  Future<UserCredential> signInWithGoogle();

  Future<void> saveUser(UserModel user);
  Future<void> forgotPassword(String email);
}
