import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract interface class HistoryDao {
  Future<void> addToHistory(int movieId);
  Future<List<int>> getHistoryIds();
}

@Injectable(as: HistoryDao)
class HistoryDaoImpl implements HistoryDao {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  HistoryDaoImpl(this._firestore, this._auth);

  CollectionReference<Map<String, dynamic>> get _historyCollection {
    final user = _auth.currentUser;
    if (user == null) throw Exception("User not logged in");
    return _firestore.collection("Users").doc(user.uid).collection("History");
  }

  @override
  Future<void> addToHistory(int movieId) async {
    await _historyCollection.doc(movieId.toString()).set({
      "movieId": movieId,
      "watchedAt": FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<List<int>> getHistoryIds() async {
    final snapshot = await _historyCollection.orderBy("watchedAt", descending: true).get();
    return snapshot.docs.map((doc) => doc.data()["movieId"] as int).toList();
  }
}
