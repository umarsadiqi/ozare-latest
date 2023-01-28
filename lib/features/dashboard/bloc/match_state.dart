part of 'match_bloc.dart';

enum MatchStatus { loading, success, failure }

class MatchState {
  final List<Match> matches;
  final MatchStatus status;

  MatchState({
    this.matches = const [],
    this.status = MatchStatus.loading,
  });

  MatchState copyWith({
    List<Match>? matches,
    MatchStatus? status,
  }) {
    return MatchState(
      matches: matches ?? this.matches,
      status: status ?? this.status,
    );
  }
}
