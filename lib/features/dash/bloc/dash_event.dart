part of 'dash_bloc.dart';

@immutable
abstract class DashEvent extends Equatable {
  const DashEvent();

  @override
  List<Object> get props => [];
}

class DashLeaguesRequested extends DashEvent {}

class DashLeaguesUpdated extends DashEvent {
  const DashLeaguesUpdated(this.leagues);

  final List<League> leagues;

  @override
  List<Object> get props => [leagues];
}

class DashLeaguesUpdateRequested extends DashEvent {
  const DashLeaguesUpdateRequested(this.leagues);

  final List<League> leagues;

  @override
  List<Object> get props => [leagues];
}
