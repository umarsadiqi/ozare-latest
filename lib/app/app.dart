import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/auth/bloc/auth_bloc.dart';
import 'package:ozare/features/auth/repository/auth_repository.dart';
import 'package:ozare/features/auth/repository/local_db_repository.dart';
import 'package:ozare/features/dashboard/bloc/match_bloc.dart';
import 'package:ozare/features/home/cubit/home_cubit.dart';
import 'package:ozare/features/profile/bloc/profile_bloc.dart';
import 'package:ozare/features/profile/repository/profile_repository.dart';
import 'package:ozare/features/splash/view/splash_page.dart';
import 'package:ozare/main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepository: getIt<AuthRepository>(),
            localDBRepository: getIt<LocalDBRepository>(),
          )..add(const AuthCheckRequested()),
        ),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        BlocProvider<MatchBloc>(create: (context) => MatchBloc()),
        BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
                  profileRepository: getIt<ProfileRepository>(),
                )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        title: 'Ozare',
        home: const SplashPage(),
      ),
    );
  }
}
