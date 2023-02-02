import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bet.freezed.dart';
part 'bet.g.dart';

@freezed
class Bet with _$Bet {
  const factory Bet({
    required String id,
    required String eventId,
    required String userId,
    required String userName,
    required String tokens,
    required String status,
    required String result,
    required String betTeamId,
    required DateTime createdAt,
  }) = _Bet;

  factory Bet.fromJson(Map<String, dynamic> json) => _$BetFromJson(json);
}
