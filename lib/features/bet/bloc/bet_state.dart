part of 'bet_bloc.dart';

enum BetStatus { initial, loading, success, failure }

class BetState extends Equatable {
  const BetState({
    this.status = BetStatus.initial,
    this.bets = const <Bet>[],
  });

  final BetStatus status;
  final List<Bet> bets;

  BetState copyWith({
    BetStatus? status,
    List<Bet>? bets,
  }) {
    return BetState(
      status: status ?? this.status,
      bets: bets ?? this.bets,
    );
  }

  @override
  List<Object> get props => [status, bets];
}
