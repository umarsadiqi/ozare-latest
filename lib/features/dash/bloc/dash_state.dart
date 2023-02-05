part of 'dash_bloc.dart';

enum DashStatus { loading, success, failure }

abstract class DashState {
  final List<League> leagues;

  const DashState({
    this.leagues = const [],
  });
}

class DashLoading extends DashState {
  const DashLoading();

  List<Object> get props => [];
}

class DashFailure extends DashState {
  const DashFailure(this.message);

  final String message;

  List<Object> get props => [];
}

class DashSoccerState extends DashState {
  const DashSoccerState({required super.leagues});

  List<Object> get props => [leagues];

  DashSoccerState copyWith({
    List<League>? leagues,
  }) {
    return DashSoccerState(leagues: leagues ?? this.leagues);
  }
}

class DashBasketballState extends DashState {
  const DashBasketballState({required super.leagues});

  List<Object> get props => [leagues];

  DashBasketballState copyWith({
    List<League>? leagues,
  }) {
    return DashBasketballState(leagues: leagues ?? this.leagues);
  }
}
