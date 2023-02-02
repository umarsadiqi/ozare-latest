part of 'dash_bloc.dart';

enum DashStatus { loading, success, failure }

class DashState {
  final List<League> leagues;
  final DashStatus status;

  DashState({
    this.leagues = const [],
    this.status = DashStatus.loading,
  });

  DashState copyWith({
    List<League>? leagues,
    DashStatus? status,
  }) {
    return DashState(
      leagues: leagues ?? this.leagues,
      status: status ?? this.status,
    );
  }
}
