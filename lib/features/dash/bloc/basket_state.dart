import 'package:equatable/equatable.dart';
import 'package:ozare/models/models.dart';

enum BasketStatus { loading, success, failure }

class BasketState extends Equatable {
  const BasketState({
    required this.leagues,
    this.status = BasketStatus.loading,
    this.message = '',
  });

  final List<League> leagues;
  final BasketStatus status;
  final String message;

  @override
  List<Object> get props => [leagues, status, message];

  BasketState copyWith({
    List<League>? leagues,
    BasketStatus? status,
    String? message,
  }) {
    return BasketState(
      leagues: leagues ?? this.leagues,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
