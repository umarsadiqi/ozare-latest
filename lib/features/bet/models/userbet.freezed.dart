// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userbet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Userbet _$UserbetFromJson(Map<String, dynamic> json) {
  return _Userbet.fromJson(json);
}

/// @nodoc
mixin _$Userbet {
  String get id => throw _privateConstructorUsedError;
  Bet get bet => throw _privateConstructorUsedError;
  Event get event => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserbetCopyWith<Userbet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserbetCopyWith<$Res> {
  factory $UserbetCopyWith(Userbet value, $Res Function(Userbet) then) =
      _$UserbetCopyWithImpl<$Res, Userbet>;
  @useResult
  $Res call({String id, Bet bet, Event event});

  $BetCopyWith<$Res> get bet;
  $EventCopyWith<$Res> get event;
}

/// @nodoc
class _$UserbetCopyWithImpl<$Res, $Val extends Userbet>
    implements $UserbetCopyWith<$Res> {
  _$UserbetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bet = null,
    Object? event = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bet: null == bet
          ? _value.bet
          : bet // ignore: cast_nullable_to_non_nullable
              as Bet,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BetCopyWith<$Res> get bet {
    return $BetCopyWith<$Res>(_value.bet, (value) {
      return _then(_value.copyWith(bet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EventCopyWith<$Res> get event {
    return $EventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserbetCopyWith<$Res> implements $UserbetCopyWith<$Res> {
  factory _$$_UserbetCopyWith(
          _$_Userbet value, $Res Function(_$_Userbet) then) =
      __$$_UserbetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Bet bet, Event event});

  @override
  $BetCopyWith<$Res> get bet;
  @override
  $EventCopyWith<$Res> get event;
}

/// @nodoc
class __$$_UserbetCopyWithImpl<$Res>
    extends _$UserbetCopyWithImpl<$Res, _$_Userbet>
    implements _$$_UserbetCopyWith<$Res> {
  __$$_UserbetCopyWithImpl(_$_Userbet _value, $Res Function(_$_Userbet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bet = null,
    Object? event = null,
  }) {
    return _then(_$_Userbet(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bet: null == bet
          ? _value.bet
          : bet // ignore: cast_nullable_to_non_nullable
              as Bet,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Userbet with DiagnosticableTreeMixin implements _Userbet {
  const _$_Userbet({required this.id, required this.bet, required this.event});

  factory _$_Userbet.fromJson(Map<String, dynamic> json) =>
      _$$_UserbetFromJson(json);

  @override
  final String id;
  @override
  final Bet bet;
  @override
  final Event event;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Userbet(id: $id, bet: $bet, event: $event)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Userbet'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bet', bet))
      ..add(DiagnosticsProperty('event', event));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Userbet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bet, bet) || other.bet == bet) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, bet, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserbetCopyWith<_$_Userbet> get copyWith =>
      __$$_UserbetCopyWithImpl<_$_Userbet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserbetToJson(
      this,
    );
  }
}

abstract class _Userbet implements Userbet {
  const factory _Userbet(
      {required final String id,
      required final Bet bet,
      required final Event event}) = _$_Userbet;

  factory _Userbet.fromJson(Map<String, dynamic> json) = _$_Userbet.fromJson;

  @override
  String get id;
  @override
  Bet get bet;
  @override
  Event get event;
  @override
  @JsonKey(ignore: true)
  _$$_UserbetCopyWith<_$_Userbet> get copyWith =>
      throw _privateConstructorUsedError;
}
