import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ozare/common/dialogs/alert_dialog.dart';
import 'package:ozare/common/widgets/loader.dart';
import 'package:ozare/features/auth/bloc/auth_bloc.dart';
import 'package:ozare/features/auth/view/signin_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/home/home.dart';
import 'package:ozare/features/onboard/view/onboard_page.dart';

import 'signup_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        log("AuthBloc State in Listener: ${state.runtimeType}");
        if (state is AuthFailure) {
          log("AuthFailue in Listener: ${state.message}");
          showAlertDialog(
            context: context,
            title: 'Failure',
            content: state.message,
          );
        }
      },
      builder: (context, state) {
        log("AuthBloc State in Builder: ${state.runtimeType}");
        if (state is AuthOnboarding) {
          return const OnboardPage();
        } else if (state is AuthLoading) {
          return Loader(message: state.message);
        } else if (state is AuthInitial) {
          return const SigninPage();
        } else if (state is AuthSignup) {
          return const SignupPage();
        } else if (state is AuthLogedIn) {
          return const HomePage();
        }

        return const Loader(message: 'Loading...');
      },
    );
  }
}
