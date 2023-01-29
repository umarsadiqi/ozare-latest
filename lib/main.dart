import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/app/app.dart';
import 'package:ozare/app/app_bloc_observer.dart';

void main() {
  // Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  // Initalize Firebase App

  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
