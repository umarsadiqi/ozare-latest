import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ozare/models/models.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ProfileRepository({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _storage = storage,
        _firestore = firestore;

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
  Stream<List<Bet>> historyStream(String uid) {
    log('Getting user history ...');
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('history')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Bet.fromJson(doc.data())).toList());
  }

  /// User's notifications stream
  Stream<List<Bet>> notificationStream(String uid) {
    log('Getting user notifications ...');
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('notification')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Bet.fromJson(doc.data())).toList());
  }

  /// Update the user's profile
  Future<void> updateProfile(OUser ouser) async {
    log('Updating user profile ...');
    await _firestore.collection('users').doc(ouser.uid).update(ouser.toJson());
  }

  /// Upload the user's profile image to firebase storage
  Future<String> uploadPhoto(String uid, XFile imageFile) async {
    log('Uploading user profile image ...');
    final ref = _storage.ref().child('users/$uid/profile.jpg');
    await ref.putFile(File(imageFile.path));
    return ref.getDownloadURL();
  }
}
