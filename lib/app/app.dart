import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/auth/view/auth_page.dart';
import 'package:ozare/features/auth/view/signup_page.dart';
import 'package:ozare/features/dashboard/bloc/match_bloc.dart';
import 'package:ozare/features/onboard/view/onboard_page.dart';
import 'package:ozare/features/splash/view/splash_page.dart';
import '../features/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => MatchBloc()..add(MatchListRequested()),
          ),
        ],
        child: const SignupPage(),
      ),
    );
  }
}
