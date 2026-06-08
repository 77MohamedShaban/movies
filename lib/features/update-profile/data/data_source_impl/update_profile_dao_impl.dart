import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/features/auth/data/model/user_model.dart';
import '../../../../core/di/di.dart';
import '../data_source/update_profile_dao.dart';

@Injectable(as: UpdateProfileDao)
class UpdateProfileDaoImpl implements UpdateProfileDao {
  final FirebaseFirestore _firestore;

  UpdateProfileDaoImpl(this._firestore);

  @override
  Future<void> updateUserData(UserModel user) async {
    await _firestore
        .collection(UserModel.usersCollection)
        .doc(user.id)
        .update(user.toJson());
  }

  @override
  Future<void> deleteUserAccount(String uid) async {
    await _firestore
        .collection(UserModel.usersCollection)
        .doc(uid)
        .delete();
    final user = getIt<FirebaseAuth>().currentUser;

    if (user != null) {
      await user.delete();
    }

    await FirebaseAuth.instance.signOut();
  }

}
