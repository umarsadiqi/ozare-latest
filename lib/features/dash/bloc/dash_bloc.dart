import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/dash/repository/dash_repository.dart';
import 'package:ozare/models/league.dart';

part 'dash_event.dart';
part 'dash_state.dart';

class DashBloc extends Bloc<DashEvent, DashState> {
  DashBloc({
    required DashRepository dashRepository,
  })  : _dashRepository = dashRepository,
        super(DashState(status: DashStatus.loading)) {
    on<DashLeaguesRequested>(_onDashLeaguesRequested);
    on<DashLeaguesUpdated>(_onDashLeaguesUpdated);
    on<DashLeaguesUpdateRequested>(_onDashLeaguesUpdateRequested);
  }

  final DashRepository _dashRepository;

  /// This method is called when the DashLeaguesRequested event is added.
  void _onDashLeaguesRequested(
    DashLeaguesRequested event,
    Emitter<DashState> emit,
  ) async {
    try {
      emit(state.copyWith(status: DashStatus.loading));
      final leagues = await _dashRepository.getLeagues();
      if (leagues != null) {
        log('leagues: ${leagues.length.toString()}');
        add(DashLeaguesUpdated(leagues));
      }
      // emit(state.copyWith(matches: matches, status: DashStatus.success));
    } catch (_) {
      emit(state.copyWith(status: DashStatus.failure));
    }
  }

  /// This method is called when the DashLeaguesUpdated event is added.
  void _onDashLeaguesUpdated(
    DashLeaguesUpdated event,
    Emitter<DashState> emit,
  ) async {
    emit(state.copyWith(leagues: event.leagues, status: DashStatus.success));
    // if (event.leagues.isEmpty) {
    //   // add delay 10 minutes
    //   await Future.delayed(const Duration(minutes: 10));
    // } else if (event.leagues.isNotEmpty) {
    //   // add delay 30 seconds
    //   await Future.delayed(const Duration(seconds: 30));
    // }
    // add(DashLeaguesUpdateRequested(event.leagues));
  }

  /// ]
  /// This method is called when the DashLeaguesUpdateRequested event is added.
  void _onDashLeaguesUpdateRequested(
    DashLeaguesUpdateRequested event,
    Emitter<DashState> emit,
  ) async {
    try {
      final leagues = await _dashRepository.getLeagues();
      if (leagues != null) {
        add(DashLeaguesUpdated(leagues));
      }
    } catch (_) {
      emit(state.copyWith(status: DashStatus.failure));
    }
  }
}
