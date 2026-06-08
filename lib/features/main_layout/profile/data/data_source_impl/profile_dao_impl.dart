import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../../../auth/data/model/user_model.dart';
import '../data_source/profile_dao.dart';

@Injectable(as: ProfileDao)
class ProfileDaoImpl implements ProfileDao {
  final FirebaseFirestore _firestore;

  ProfileDaoImpl(this._firestore);

  @override
  Future<UserModel?> getUserData(String uid) async {
    final doc = await _firestore
        .collection(UserModel.usersCollection)
        .doc(uid)
        .get();
    
    if (doc.exists) {
      return UserModel.fromJson(doc.data());
    }
    return null;
  }
}
