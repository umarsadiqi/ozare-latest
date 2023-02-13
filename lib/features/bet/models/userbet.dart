import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ozare/models/event.dart';

import 'bet.dart';

part 'userbet.freezed.dart';
part 'userbet.g.dart';

@freezed
class Userbet with _$Userbet {
  const factory Userbet({
    required String id,
    required Bet bet,
    required Event event,
  }) = _Userbet;

  factory Userbet.fromJson(Map<String, dynamic> json) =>
      _$UserbetFromJson(json);
}
