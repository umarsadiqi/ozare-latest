import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ozare/features/bet/models/bet.dart';

class BetRepository {
  BetRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  // Create new Bet in current event
  Future<void> createBet(String eventId, Bet bet) async {
    log('BetRepository: createBet: $eventId');
    await _firestore
        .collection('events')
        .doc(eventId)
        .collection('bets')
        .doc(bet.id)
        .set(bet.toJson());
  }

  // Get all bets in current event
  Stream<List<Bet>> betStream(String eventId) {
    return _firestore
        .collection('events')
        .doc(eventId)
        .collection('bets')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Bet.fromJson(doc.data())).toList());
  }
}
