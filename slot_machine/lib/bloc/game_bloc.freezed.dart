// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameEventTearOff {
  const _$GameEventTearOff();

  _GameEvent roll() {
    return const _GameEvent();
  }
}

/// @nodoc
const $GameEvent = _$GameEventTearOff();

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEvent value) roll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEvent value)? roll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res> implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  final GameEvent _value;
  // ignore: unused_field
  final $Res Function(GameEvent) _then;
}

/// @nodoc
abstract class _$GameEventCopyWith<$Res> {
  factory _$GameEventCopyWith(
          _GameEvent value, $Res Function(_GameEvent) then) =
      __$GameEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$GameEventCopyWithImpl<$Res> extends _$GameEventCopyWithImpl<$Res>
    implements _$GameEventCopyWith<$Res> {
  __$GameEventCopyWithImpl(_GameEvent _value, $Res Function(_GameEvent) _then)
      : super(_value, (v) => _then(v as _GameEvent));

  @override
  _GameEvent get _value => super._value as _GameEvent;
}

/// @nodoc
class _$_GameEvent implements _GameEvent {
  const _$_GameEvent();

  @override
  String toString() {
    return 'GameEvent.roll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GameEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roll,
  }) {
    return roll();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roll,
    required TResult orElse(),
  }) {
    if (roll != null) {
      return roll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GameEvent value) roll,
  }) {
    return roll(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GameEvent value)? roll,
    required TResult orElse(),
  }) {
    if (roll != null) {
      return roll(this);
    }
    return orElse();
  }
}

abstract class _GameEvent implements GameEvent {
  const factory _GameEvent() = _$_GameEvent;
}

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  _GameState call({required List<NumberController> numbers, Object? error}) {
    return _GameState(
      numbers: numbers,
      error: error,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  List<NumberController> get numbers => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call({List<NumberController> numbers, Object? error});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object? numbers = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      numbers: numbers == freezed
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<NumberController>,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
abstract class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) then) =
      __$GameStateCopyWithImpl<$Res>;
  @override
  $Res call({List<NumberController> numbers, Object? error});
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(_GameState _value, $Res Function(_GameState) _then)
      : super(_value, (v) => _then(v as _GameState));

  @override
  _GameState get _value => super._value as _GameState;

  @override
  $Res call({
    Object? numbers = freezed,
    Object? error = freezed,
  }) {
    return _then(_GameState(
      numbers: numbers == freezed
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<NumberController>,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
class _$_GameState implements _GameState {
  const _$_GameState({required this.numbers, this.error});

  @override
  final List<NumberController> numbers;
  @override
  final Object? error;

  @override
  String toString() {
    return 'GameState(numbers: $numbers, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameState &&
            (identical(other.numbers, numbers) ||
                const DeepCollectionEquality()
                    .equals(other.numbers, numbers)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(numbers) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {required List<NumberController> numbers, Object? error}) = _$_GameState;

  @override
  List<NumberController> get numbers => throw _privateConstructorUsedError;
  @override
  Object? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
