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

  _GameState call(
      {required List<NumberController> numbers,
      String? id,
      String? name,
      int tokenCount = 0,
      bool isLoading = false,
      Object? error}) {
    return _GameState(
      numbers: numbers,
      id: id,
      name: name,
      tokenCount: tokenCount,
      isLoading: isLoading,
      error: error,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  List<NumberController> get numbers => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int get tokenCount => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call(
      {List<NumberController> numbers,
      String? id,
      String? name,
      int tokenCount,
      bool isLoading,
      Object? error});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? tokenCount = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      numbers: numbers == freezed
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<NumberController>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenCount: tokenCount == freezed
          ? _value.tokenCount
          : tokenCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {List<NumberController> numbers,
      String? id,
      String? name,
      int tokenCount,
      bool isLoading,
      Object? error});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? tokenCount = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_GameState(
      numbers: numbers == freezed
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<NumberController>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenCount: tokenCount == freezed
          ? _value.tokenCount
          : tokenCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
class _$_GameState implements _GameState {
  const _$_GameState(
      {required this.numbers,
      this.id,
      this.name,
      this.tokenCount = 0,
      this.isLoading = false,
      this.error});

  @override
  final List<NumberController> numbers;
  @override
  final String? id;
  @override
  final String? name;
  @JsonKey(defaultValue: 0)
  @override
  final int tokenCount;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final Object? error;

  @override
  String toString() {
    return 'GameState(numbers: $numbers, id: $id, name: $name, tokenCount: $tokenCount, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameState &&
            (identical(other.numbers, numbers) ||
                const DeepCollectionEquality()
                    .equals(other.numbers, numbers)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tokenCount, tokenCount) ||
                const DeepCollectionEquality()
                    .equals(other.tokenCount, tokenCount)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(numbers) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tokenCount) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {required List<NumberController> numbers,
      String? id,
      String? name,
      int tokenCount,
      bool isLoading,
      Object? error}) = _$_GameState;

  @override
  List<NumberController> get numbers => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  int get tokenCount => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Object? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
