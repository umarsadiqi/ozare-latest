import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ozare/models/models.dart';

class EventRepository {
  EventRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  // create new document with id of the event in events collection
  Future<void> initializeEvent(Event event) async {
    await _firestore.collection('events').doc(event.id).set(event.toJson());
  }
}
