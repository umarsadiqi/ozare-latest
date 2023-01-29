import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/app/app.dart';
import 'package:ozare/app/app_bloc_observer.dart';
import 'package:ozare/firebase_options.dart';

void main() async {
  // Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  // Initalize Firebase App
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
