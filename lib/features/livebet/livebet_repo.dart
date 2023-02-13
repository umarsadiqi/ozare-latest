import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ozare/models/livebet.dart';

class LiveBetRepo {
  LiveBetRepo({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  // Get live bets for current user
  Stream<List<LiveBet>> liveBetStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('bets')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => LiveBet.fromJson(doc.data())).toList();
    });
  }
}
