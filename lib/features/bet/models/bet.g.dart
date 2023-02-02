// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bet _$$_BetFromJson(Map<String, dynamic> json) => _$_Bet(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      tokens: json['tokens'] as String,
      status: json['status'] as String,
      result: json['result'] as String,
      betTeamId: json['betTeamId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_BetToJson(_$_Bet instance) => <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'userId': instance.userId,
      'userName': instance.userName,
      'tokens': instance.tokens,
      'status': instance.status,
      'result': instance.result,
      'betTeamId': instance.betTeamId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
