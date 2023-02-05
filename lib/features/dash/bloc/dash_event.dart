part of 'dash_bloc.dart';

@immutable
abstract class DashEvent extends Equatable {
  const DashEvent();

  @override
  List<Object> get props => [];
}

class DashLeaguesRequested extends DashEvent {
  final String category;

  const DashLeaguesRequested(this.category);
}

class DashLeaguesUpdated extends DashEvent {
  const DashLeaguesUpdated(this.leagues, this.category);

  final String category;
  final List<League> leagues;

  @override
  List<Object> get props => [leagues, category];
}

class DashLeaguesUpdateRequested extends DashEvent {
  const DashLeaguesUpdateRequested(this.leagues, this.category);

  final List<League> leagues;
  final String category;
  @override
  List<Object> get props => [leagues, category];
}

class DashCategoryChanged extends DashEvent {
  const DashCategoryChanged(this.category);
  final String category;
  final List<League> leagues = const [];

  @override
  List<Object> get props => [category, leagues];
}
