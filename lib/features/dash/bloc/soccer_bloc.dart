import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ozare/features/dash/repository/dash_repository.dart';
import 'package:ozare/models/league.dart';

part 'soccer_event.dart';
part 'soccer_state.dart';

class SoccerBloc extends Bloc<SoccerEvent, SoccerState> {
  SoccerBloc({
    required DashRepository dashRepository,
  })  : _dashRepository = dashRepository,
        super(const SoccerState(leagues: [])) {
    on<SoccerLeaguesRequested>(_onSoccerLeaguesRequested);
  }

  final DashRepository _dashRepository;

  /// Event handler for SoccerLeaguesRequested
  void _onSoccerLeaguesRequested(
    SoccerLeaguesRequested event,
    Emitter<SoccerState> emit,
  ) async {
    log('DashSoccerLeaguesRequested event called!');
    try {
      emit(state.copyWith(status: SoccerStatus.loading, message: 'Loading...'));
      while (true) {
        final leagues = await _dashRepository.getLeagues('soccer');
        emit(SoccerState(
            leagues: leagues,
            status: SoccerStatus.success,
            message: 'success'));

        await Future<void>.delayed(const Duration(seconds: 5));
      }
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(
          status: SoccerStatus.failure, message: error.toString()));
    }
  }
}
