import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/dashboard/models/match.dart';
import 'package:ozare/features/dashboard/repository/match_repository.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc({
    required MatchRepository matchRepository,
  })  : _matchRepository = matchRepository,
        super(MatchState(status: MatchStatus.loading)) {
    on<MatchListRequested>(_onMatchListRequested);
  }

  final MatchRepository _matchRepository;

  void _onMatchListRequested(
    MatchListRequested event,
    Emitter<MatchState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MatchStatus.loading));
      final matches = await _matchRepository.getMatchList();
      if (matches != null) {
        log('matches: ${matches.length.toString()}');
        emit(state.copyWith(matches: matches, status: MatchStatus.success));
      }
      // emit(state.copyWith(matches: matches, status: MatchStatus.success));
    } catch (_) {
      emit(state.copyWith(status: MatchStatus.failure));
    }
  }
}
