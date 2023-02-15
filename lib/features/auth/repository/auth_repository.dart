import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ozare/models/models.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  ///
  Future<OUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // after login fetch data from firestore for the user
      final doc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      return OUser.fromJson(doc.data()!);
    } catch (e) {
      log("Error in signInWithEmailAndPassword (auth_reposity): $e");
      rethrow;
    }
  }

  Future<OUser> signUpWithEmailAndPassword({
    required OUser ouser,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: ouser.email,
        password: password,
      );

      ouser = ouser.copyWith(
        uid: userCredential.user!.uid,
      );
      log(ouser.toString());
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(ouser.toJson());

      return ouser;
    } catch (e) {
      log("Error in signUpWithEmailAndPassword (auth_reposity): $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log("Error in signOut (auth_reposity): $e");
      rethrow;
    }
  }

  Stream<OUser> getOwner(String uid) {
    try {
      return _firestore
          .collection('users')
          .doc(uid)
          .snapshots()
          .map((event) => OUser.fromJson(event.data()!));
    } catch (e) {
      log("Error in getOwner (auth_reposity): $e");
      rethrow;
    }
  }

  // sign in with google account and if the user is new then create a new user
  // in firestore with the ouser data
  Future<OUser> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;

      // check if the user is new or not
      final doc = await _firestore.collection('users').doc(user!.uid).get();

      if (doc.exists) {
        return OUser.fromJson(doc.data()!);
      } else {
        final OUser ouser = OUser(
          uid: user.uid,
          email: user.email!,
          photoURL: user.photoURL!,
          firstName: user.displayName ?? '',
          lastName: '',
        );

        await _firestore.collection('users').doc(user.uid).set(ouser.toJson());

        return ouser;
      }
    } catch (e) {
      log("Error in signInWithGoogle (auth_reposity): $e");
      rethrow;
    }
  }
}
