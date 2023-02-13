// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userbet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Userbet _$$_UserbetFromJson(Map<String, dynamic> json) => _$_Userbet(
      id: json['id'] as String,
      bet: Bet.fromJson(json['bet'] as Map<String, dynamic>),
      event: Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserbetToJson(_$_Userbet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bet': instance.bet,
      'event': instance.event,
    };
