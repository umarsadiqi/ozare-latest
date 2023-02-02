// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bet _$BetFromJson(Map<String, dynamic> json) {
  return _Bet.fromJson(json);
}

/// @nodoc
mixin _$Bet {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get tokens => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  String get betTeamId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BetCopyWith<Bet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BetCopyWith<$Res> {
  factory $BetCopyWith(Bet value, $Res Function(Bet) then) =
      _$BetCopyWithImpl<$Res, Bet>;
  @useResult
  $Res call(
      {String id,
      String eventId,
      String userId,
      String userName,
      String tokens,
      String status,
      String result,
      String betTeamId,
      DateTime createdAt});
}

/// @nodoc
class _$BetCopyWithImpl<$Res, $Val extends Bet> implements $BetCopyWith<$Res> {
  _$BetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? userName = null,
    Object? tokens = null,
    Object? status = null,
    Object? result = null,
    Object? betTeamId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      betTeamId: null == betTeamId
          ? _value.betTeamId
          : betTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BetCopyWith<$Res> implements $BetCopyWith<$Res> {
  factory _$$_BetCopyWith(_$_Bet value, $Res Function(_$_Bet) then) =
      __$$_BetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String eventId,
      String userId,
      String userName,
      String tokens,
      String status,
      String result,
      String betTeamId,
      DateTime createdAt});
}

/// @nodoc
class __$$_BetCopyWithImpl<$Res> extends _$BetCopyWithImpl<$Res, _$_Bet>
    implements _$$_BetCopyWith<$Res> {
  __$$_BetCopyWithImpl(_$_Bet _value, $Res Function(_$_Bet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? userName = null,
    Object? tokens = null,
    Object? status = null,
    Object? result = null,
    Object? betTeamId = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Bet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      betTeamId: null == betTeamId
          ? _value.betTeamId
          : betTeamId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bet with DiagnosticableTreeMixin implements _Bet {
  const _$_Bet(
      {required this.id,
      required this.eventId,
      required this.userId,
      required this.userName,
      required this.tokens,
      required this.status,
      required this.result,
      required this.betTeamId,
      required this.createdAt});

  factory _$_Bet.fromJson(Map<String, dynamic> json) => _$$_BetFromJson(json);

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String tokens;
  @override
  final String status;
  @override
  final String result;
  @override
  final String betTeamId;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Bet(id: $id, eventId: $eventId, userId: $userId, userName: $userName, tokens: $tokens, status: $status, result: $result, betTeamId: $betTeamId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Bet'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('eventId', eventId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('tokens', tokens))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('betTeamId', betTeamId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.tokens, tokens) || other.tokens == tokens) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.betTeamId, betTeamId) ||
                other.betTeamId == betTeamId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, eventId, userId, userName,
      tokens, status, result, betTeamId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BetCopyWith<_$_Bet> get copyWith =>
      __$$_BetCopyWithImpl<_$_Bet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BetToJson(
      this,
    );
  }
}

abstract class _Bet implements Bet {
  const factory _Bet(
      {required final String id,
      required final String eventId,
      required final String userId,
      required final String userName,
      required final String tokens,
      required final String status,
      required final String result,
      required final String betTeamId,
      required final DateTime createdAt}) = _$_Bet;

  factory _Bet.fromJson(Map<String, dynamic> json) = _$_Bet.fromJson;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get tokens;
  @override
  String get status;
  @override
  String get result;
  @override
  String get betTeamId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_BetCopyWith<_$_Bet> get copyWith => throw _privateConstructorUsedError;
}
