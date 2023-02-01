// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get score1 => throw _privateConstructorUsedError;
  String get score2 => throw _privateConstructorUsedError;
  String get team1 => throw _privateConstructorUsedError;
  String get team2 => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get logo1 => throw _privateConstructorUsedError;
  String get logo2 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String id,
      String score1,
      String score2,
      String team1,
      String team2,
      String time,
      String logo1,
      String logo2});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score1 = null,
    Object? score2 = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? time = null,
    Object? logo1 = null,
    Object? logo2 = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      score1: null == score1
          ? _value.score1
          : score1 // ignore: cast_nullable_to_non_nullable
              as String,
      score2: null == score2
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as String,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as String,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      logo1: null == logo1
          ? _value.logo1
          : logo1 // ignore: cast_nullable_to_non_nullable
              as String,
      logo2: null == logo2
          ? _value.logo2
          : logo2 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String score1,
      String score2,
      String team1,
      String team2,
      String time,
      String logo1,
      String logo2});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? score1 = null,
    Object? score2 = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? time = null,
    Object? logo1 = null,
    Object? logo2 = null,
  }) {
    return _then(_$_Event(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      score1: null == score1
          ? _value.score1
          : score1 // ignore: cast_nullable_to_non_nullable
              as String,
      score2: null == score2
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as String,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as String,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      logo1: null == logo1
          ? _value.logo1
          : logo1 // ignore: cast_nullable_to_non_nullable
              as String,
      logo2: null == logo2
          ? _value.logo2
          : logo2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Event with DiagnosticableTreeMixin implements _Event {
  const _$_Event(
      {required this.id,
      required this.score1,
      required this.score2,
      required this.team1,
      required this.team2,
      required this.time,
      required this.logo1,
      required this.logo2});

  @override
  final String id;
  @override
  final String score1;
  @override
  final String score2;
  @override
  final String team1;
  @override
  final String team2;
  @override
  final String time;
  @override
  final String logo1;
  @override
  final String logo2;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, score1: $score1, score2: $score2, team1: $team1, team2: $team2, time: $time, logo1: $logo1, logo2: $logo2)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('score1', score1))
      ..add(DiagnosticsProperty('score2', score2))
      ..add(DiagnosticsProperty('team1', team1))
      ..add(DiagnosticsProperty('team2', team2))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('logo1', logo1))
      ..add(DiagnosticsProperty('logo2', logo2));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.score1, score1) || other.score1 == score1) &&
            (identical(other.score2, score2) || other.score2 == score2) &&
            (identical(other.team1, team1) || other.team1 == team1) &&
            (identical(other.team2, team2) || other.team2 == team2) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.logo1, logo1) || other.logo1 == logo1) &&
            (identical(other.logo2, logo2) || other.logo2 == logo2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, score1, score2, team1, team2, time, logo1, logo2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);
}

abstract class _Event implements Event {
  const factory _Event(
      {required final String id,
      required final String score1,
      required final String score2,
      required final String team1,
      required final String team2,
      required final String time,
      required final String logo1,
      required final String logo2}) = _$_Event;

  @override
  String get id;
  @override
  String get score1;
  @override
  String get score2;
  @override
  String get team1;
  @override
  String get team2;
  @override
  String get time;
  @override
  String get logo1;
  @override
  String get logo2;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
