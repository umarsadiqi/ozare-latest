import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ozare/models/models.dart';

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
}
