import 'package:equatable/equatable.dart';
import 'package:ozare/features/auth/repository/repository.dart';
import 'package:ozare/features/livebet/livebet_repo.dart';
import 'package:ozare/main.dart';
import 'package:ozare/models/livebet.dart';
import 'package:ozare/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'livebet_event.dart';
part 'livebet_state.dart';

class LivebetBloc extends Bloc<LiveBetEvent, LiveBetState> {
  LivebetBloc({
    required LiveBetRepo repo,
  })  : _repo = repo,
        super(const LiveBetState()) {
    on<LiveBetsRequested>(_onLiveBetsRequested);
  }

  final LiveBetRepo _repo;
  final OUser ouser = getIt<LocalDBRepository>().getOwner()!;

  /// This method is called when the LiveBetsRequested event is added.
  void _onLiveBetsRequested(
    LiveBetsRequested event,
    Emitter<LiveBetState> emit,
  ) async {
    await emit.forEach(
      _repo.liveBetStream(ouser.uid!),
      onData: (bets) => state.copyWith(liveBets: bets),
    );
  }
}
