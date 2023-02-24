import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ozare/features/auth/repository/local_db_repository.dart';
import 'package:ozare/features/bet/repository/bet_repository.dart';
import 'package:collection/collection.dart';
import 'package:ozare/main.dart';
import 'package:ozare/models/models.dart';

part 'bet_event.dart';
part 'bet_state.dart';

class BetBloc extends Bloc<BetEvent, BetState> {
  BetBloc({
    required BetRepository betRepository,
    required this.eventId,
  })  : _betRepository = betRepository,
        super(const BetState()) {
    on<BetCreated>(_onBetCreated);
    on<BetSubscriptionRequested>(_onSubscriptionRequested);
    on<BetsUpdated>(_onBetsUpdated);
  }

  final BetRepository _betRepository;
  final String eventId;

  final OUser ouser = getIt<LocalDBRepository>().getOwner()!;

  /// EVENT HANDLERS
  /// [BetCreated] event handler
  void _onBetCreated(
    BetCreated event,
    Emitter<BetState> emit,
  ) async {
    final Bet? bet =
        state.bets.firstWhereOrNull((b) => b.userId == event.bet.userId);

    if (bet != null) {
      emit(state.copyWith(betStatus: CreateBetStatus.exists));
    } else {
      await _betRepository.createBet(
        bet: event.bet,
      );
      emit(state.copyWith(
          status: BetStatus.success, betStatus: CreateBetStatus.created));
    }
  }

  /// [BetsUpdated] event handler
  /// This event is triggered when the bets are updated

  void _onBetsUpdated(
    BetsUpdated event,
    Emitter<BetState> emit,
  ) {
    emit(state.copyWith(bets: event.bets, status: BetStatus.success));
  }

  /// Bet Stream
  Future<void> _onSubscriptionRequested(
    BetSubscriptionRequested event,
    Emitter<BetState> emit,
  ) async {
    await emit.forEach(_betRepository.betStream(eventId),
        onData: (bets) => state.copyWith(
              bets: bets,
              status: BetStatus.success,
            ),
        onError: (erro, __) {
          log('BetBloc: onError: ${erro.toString()}');
          return state.copyWith(
            status: BetStatus.failure,
          );
        });
  }
}
