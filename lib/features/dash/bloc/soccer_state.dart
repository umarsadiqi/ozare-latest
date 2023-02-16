part of 'soccer_bloc.dart';

enum SoccerStatus { loading, success, failure }

class SoccerState extends Equatable {
  const SoccerState({
    required this.leagues,
    this.status = SoccerStatus.loading,
    this.message = '',
  });

  final List<League> leagues;
  final SoccerStatus status;
  final String message;

  @override
  List<Object> get props => [leagues, status, message];

  SoccerState copyWith({
    List<League>? leagues,
    SoccerStatus? status,
    String? message,
  }) {
    return SoccerState(
      leagues: leagues ?? this.leagues,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
