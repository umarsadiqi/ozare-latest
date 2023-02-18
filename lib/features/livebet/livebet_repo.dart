import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ozare/features/event/repository/event_repository.dart';
import 'package:ozare/models/bet.dart';

class LiveBetRepo {
  LiveBetRepo({
    required FirebaseFirestore firestore,
    required EventRepository eventRepo,
  })  : _eventRepo = eventRepo,
        _firestore = firestore;

  final FirebaseFirestore _firestore;
  final EventRepository _eventRepo;

  // Get live bets for current user
  Stream<List<Bet>> liveBetStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('bets')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Bet.fromJson(doc.data())).toList();
    });
  }

  /// get all bets for current user
  /// check for live score of each bet
  /// if match's time is FT then update won/lost in profile
  /// make current bet as history and remove from bets in firestore
  Future<void> updatesBet(String uid) async {
    // 1
    // get all bets for current user as List<LiveBet>
    final liveBetSnapshots =
        await _firestore.collection('users').doc(uid).collection('bets').get();
    final liveBets =
        liveBetSnapshots.docs.map((doc) => Bet.fromJson(doc.data())).toList();

    // 2
    // check for live score of each bet with _eventRepo's getScore method
    // if match's time is FT then update won/lost in profile
    // make current bet as history and remove from bets in firestore
    for (var bet in liveBets) {
      final event = await _eventRepo.getEventScoreboard(
        eid: bet.eventId,
        category: bet.category,
      );
      if (event != null) {
        if (event.time == 'FT') {
          // check which team won by comparing score
          final firstTeamWon =
              int.parse(event.score1) > int.parse(event.score2);

          // check if won or lost
          final won = (bet.yourTeam == 0 && firstTeamWon) ||
              (bet.yourTeam == 1 && !firstTeamWon);

          // update won or loss in profile
          await _firestore.collection('users').doc(uid).update({
            'wins': won ? FieldValue.increment(1) : FieldValue.increment(0),
            'losses': won ? FieldValue.increment(0) : FieldValue.increment(1),
          });

          // make current bet as history
          await _firestore
              .collection('users')
              .doc(uid)
              .collection('history')
              .doc(bet.id)
              .set(bet
                  .copyWith(
                    won: won,
                  )
                  .toJson());

          //remove from bets in firestore
          await _firestore
              .collection('users')
              .doc(uid)
              .collection('bets')
              .doc(bet.id)
              .delete();

          // remove event from events collection
          await _firestore.collection('events').doc(bet.eventId).delete();
        }
      }
    }
  }
}
