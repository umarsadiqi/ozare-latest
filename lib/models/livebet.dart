import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'livebet.freezed.dart';
part 'livebet.g.dart';

@freezed
class LiveBet with _$LiveBet {
  const factory LiveBet({
    required String id,
    required String eventId,
    required String tokens,
    required String status,
    required String score1,
    required String score2,
    required String team1,
    required String team2,
    required String time,
    required String logo1,
    required String logo2,
  }) = _LiveBet;

  factory LiveBet.fromJson(Map<String, dynamic> json) =>
      _$LiveBetFromJson(json);
}
