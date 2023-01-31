import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ozare/app/app.dart';
import 'package:ozare/app/app_bloc_observer.dart';
import 'package:ozare/features/profile/repository/profile_repository.dart';
import 'package:ozare/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/repository/repository.dart';

final getIt = GetIt.instance;

void main() async {
  // Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  // Initalize Firebase App
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupDependencies();

  Bloc.observer = AppBlocObserver();
  runApp(const App());
}

Future<void> setupDependencies() async {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  getIt.registerSingleton<AuthRepository>(AuthRepository(
      firebaseAuth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance));
  getIt.registerSingleton<LocalDBRepository>(
      LocalDBRepository(sharedPreferences: getIt<SharedPreferences>()));
  getIt.registerSingleton<ProfileRepository>(
      ProfileRepository(firestore: getIt<FirebaseFirestore>()));
}
