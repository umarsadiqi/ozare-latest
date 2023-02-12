import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ozare/models/history.dart';
import 'package:ozare/models/models.dart';
import 'package:ozare/models/notification.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore;

  ProfileRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  /// Get the user's profile
  Stream<OUser> ouserStream(String uid) {
    log('Getting user profile ...');
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((snapshot) => OUser.fromJson(snapshot.data()!));
  }

  /// User's history stream
  Stream<List<History>> historyStream(String uid) {
    log('Getting user history ...');
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('history')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => History.fromJson(doc.data())).toList());
  }

  /// User's notifications stream
  Stream<List<Notification>> notificationStream(String uid) {
    log('Getting user notifications ...');
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('notification')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Notification.fromJson(doc.data()))
            .toList());
  }

  /// Update the user's profile
  Future<void> updateProfile(OUser ouser) async {
    log('Updating user profile ...');
    await _firestore.collection('users').doc(ouser.uid).update(ouser.toJson());
  }
}
