part of 'livebet_bloc.dart';

enum LiveBetStatus { loading, success, failure }

class LiveBetState extends Equatable {
  const LiveBetState({
    this.status = LiveBetStatus.loading,
    this.liveBets = const <LiveBet>[],
  });

  final LiveBetStatus status;
  final List<LiveBet> liveBets;

  LiveBetState copyWith({
    LiveBetStatus? status,
    List<LiveBet>? liveBets,
  }) {
    return LiveBetState(
      status: status ?? this.status,
      liveBets: liveBets ?? this.liveBets,
    );
  }

  @override
  List<Object> get props => [status, liveBets];
}
