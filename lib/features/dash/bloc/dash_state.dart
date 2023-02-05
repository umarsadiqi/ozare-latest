part of 'dash_bloc.dart';

enum DashStatus { loading, success, failure }

enum SportsCategory { soccer, basketball }

class DashState {
  final List<League> leagues;
  final DashStatus status;
  final SportsCategory category;

  DashState({
    this.leagues = const [],
    this.status = DashStatus.loading,
    this.category = SportsCategory.soccer,
  });

  DashState copyWith({
    List<League>? leagues,
    DashStatus? status,
    SportsCategory? category,
  }) {
    return DashState(
      leagues: leagues ?? this.leagues,
      status: status ?? this.status,
      category: category ?? this.category,
    );
  }
}
