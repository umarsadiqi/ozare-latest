import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/dashboard/bloc/match_bloc.dart';
import 'package:ozare/features/home/cubit/home_cubit.dart';
import 'package:ozare/features/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
