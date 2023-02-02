part of 'bet_bloc.dart';

abstract class BetEvent extends Equatable {
  const BetEvent();

  @override
  List<Object> get props => [];
}

class BetCreated extends BetEvent {
  const BetCreated(this.bet);

  final Bet bet;

  @override
  List<Object> get props => [bet];
}

class BetsUpdated extends BetEvent {
  const BetsUpdated(this.bets);

  final List<Bet> bets;

  @override
  List<Object> get props => [bets];
}

class BetSubscriptionRequested extends BetEvent {
  const BetSubscriptionRequested();

  @override
  List<Object> get props => [];
}
