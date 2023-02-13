// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livebet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveBet _$$_LiveBetFromJson(Map<String, dynamic> json) => _$_LiveBet(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      tokens: json['tokens'] as String,
      status: json['status'] as String,
      score1: json['score1'] as String,
      score2: json['score2'] as String,
      team1: json['team1'] as String,
      team2: json['team2'] as String,
      time: json['time'] as String,
      logo1: json['logo1'] as String,
      logo2: json['logo2'] as String,
    );

Map<String, dynamic> _$$_LiveBetToJson(_$_LiveBet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'tokens': instance.tokens,
      'status': instance.status,
      'score1': instance.score1,
      'score2': instance.score2,
      'team1': instance.team1,
      'team2': instance.team2,
      'time': instance.time,
      'logo1': instance.logo1,
      'logo2': instance.logo2,
    };
