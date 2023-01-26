import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template app_bloc_observer}
/// [BlocObserver] for the application which
/// observes all bloc and cubit instances.
/// {@endtemplate}

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('$bloc $change');
  }
}
