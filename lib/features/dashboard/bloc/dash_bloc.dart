import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/dashboard/repository/dash_repository.dart';
import 'package:ozare/models/league.dart';

part 'dash_event.dart';
part 'dash_state.dart';

class DashBloc extends Bloc<DashEvent, DashState> {
  DashBloc({
    required DashRepository dashRepository,
  })  : _dashRepository = dashRepository,
        super(DashState(status: DashStatus.loading)) {
    on<DashLeaguesRequested>(_onDashLeaguesRequested);
  }

  final DashRepository _dashRepository;

  void _onDashLeaguesRequested(
    DashLeaguesRequested event,
    Emitter<DashState> emit,
  ) async {
    try {
      emit(state.copyWith(status: DashStatus.loading));
      final leagues = await _dashRepository.getLeagues();
      if (leagues != null) {
        log('leagues: ${leagues.length.toString()}');
        emit(state.copyWith(leagues: leagues, status: DashStatus.success));
      }
      // emit(state.copyWith(matches: matches, status: DashStatus.success));
    } catch (_) {
      emit(state.copyWith(status: DashStatus.failure));
    }
  }
}
