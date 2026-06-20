import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract interface class WatchlistDao {
  Future<void> addToWatchlist(int movieId);
  Future<void> removeFromWatchlist(int movieId);
  Future<List<int>> getWatchlistIds();
  Stream<List<int>> watchWatchlistIds();
}

@Injectable(as: WatchlistDao)
class WatchlistDaoImpl implements WatchlistDao {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  WatchlistDaoImpl(this._firestore, this._auth);

  CollectionReference<Map<String, dynamic>> get _watchlistCollection {
    final user = _auth.currentUser;
    if (user == null) throw Exception("User not logged in");
    return _firestore.collection("Users").doc(user.uid).collection("Watchlist");
  }

  @override
  Future<void> addToWatchlist(int movieId) async {
    await _watchlistCollection.doc(movieId.toString()).set({
      "movieId": movieId,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> removeFromWatchlist(int movieId) async {
    await _watchlistCollection.doc(movieId.toString()).delete();
  }

  @override
  Future<List<int>> getWatchlistIds() async {
    final snapshot = await _watchlistCollection.get();
    return snapshot.docs.map((doc) => doc.data()["movieId"] as int).toList();
  }

  @override
  Stream<List<int>> watchWatchlistIds() {
    return _watchlistCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()["movieId"] as int).toList();
    });
  }
}
