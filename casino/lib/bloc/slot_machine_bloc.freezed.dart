// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'slot_machine_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SlotMachineEventTearOff {
  const _$SlotMachineEventTearOff();

  _Load load(String id) {
    return _Load(
      id,
    );
  }

  _AddToken addToken() {
    return const _AddToken();
  }

  _RemoveToken removeToken() {
    return const _RemoveToken();
  }

  _SetTokenCount setTokenCount(int count) {
    return _SetTokenCount(
      count,
    );
  }
}

/// @nodoc
const $SlotMachineEvent = _$SlotMachineEventTearOff();

/// @nodoc
mixin _$SlotMachineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() addToken,
    required TResult Function() removeToken,
    required TResult Function(int count) setTokenCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? addToken,
    TResult Function()? removeToken,
    TResult Function(int count)? setTokenCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddToken value) addToken,
    required TResult Function(_RemoveToken value) removeToken,
    required TResult Function(_SetTokenCount value) setTokenCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddToken value)? addToken,
    TResult Function(_RemoveToken value)? removeToken,
    TResult Function(_SetTokenCount value)? setTokenCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotMachineEventCopyWith<$Res> {
  factory $SlotMachineEventCopyWith(
          SlotMachineEvent value, $Res Function(SlotMachineEvent) then) =
      _$SlotMachineEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SlotMachineEventCopyWithImpl<$Res>
    implements $SlotMachineEventCopyWith<$Res> {
  _$SlotMachineEventCopyWithImpl(this._value, this._then);

  final SlotMachineEvent _value;
  // ignore: unused_field
  final $Res Function(SlotMachineEvent) _then;
}

/// @nodoc
abstract class _$LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) then) =
      __$LoadCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> extends _$SlotMachineEventCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(_Load _value, $Res Function(_Load) _then)
      : super(_value, (v) => _then(v as _Load));

  @override
  _Load get _value => super._value as _Load;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_Load(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_Load implements _Load {
  const _$_Load(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'SlotMachineEvent.load(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Load &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$LoadCopyWith<_Load> get copyWith =>
      __$LoadCopyWithImpl<_Load>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() addToken,
    required TResult Function() removeToken,
    required TResult Function(int count) setTokenCount,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? addToken,
    TResult Function()? removeToken,
    TResult Function(int count)? setTokenCount,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddToken value) addToken,
    required TResult Function(_RemoveToken value) removeToken,
    required TResult Function(_SetTokenCount value) setTokenCount,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddToken value)? addToken,
    TResult Function(_RemoveToken value)? removeToken,
    TResult Function(_SetTokenCount value)? setTokenCount,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements SlotMachineEvent {
  const factory _Load(String id) = _$_Load;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadCopyWith<_Load> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddTokenCopyWith<$Res> {
  factory _$AddTokenCopyWith(_AddToken value, $Res Function(_AddToken) then) =
      __$AddTokenCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddTokenCopyWithImpl<$Res> extends _$SlotMachineEventCopyWithImpl<$Res>
    implements _$AddTokenCopyWith<$Res> {
  __$AddTokenCopyWithImpl(_AddToken _value, $Res Function(_AddToken) _then)
      : super(_value, (v) => _then(v as _AddToken));

  @override
  _AddToken get _value => super._value as _AddToken;
}

/// @nodoc
class _$_AddToken implements _AddToken {
  const _$_AddToken();

  @override
  String toString() {
    return 'SlotMachineEvent.addToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AddToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() addToken,
    required TResult Function() removeToken,
    required TResult Function(int count) setTokenCount,
  }) {
    return addToken();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? addToken,
    TResult Function()? removeToken,
    TResult Function(int count)? setTokenCount,
    required TResult orElse(),
  }) {
    if (addToken != null) {
      return addToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddToken value) addToken,
    required TResult Function(_RemoveToken value) removeToken,
    required TResult Function(_SetTokenCount value) setTokenCount,
  }) {
    return addToken(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddToken value)? addToken,
    TResult Function(_RemoveToken value)? removeToken,
    TResult Function(_SetTokenCount value)? setTokenCount,
    required TResult orElse(),
  }) {
    if (addToken != null) {
      return addToken(this);
    }
    return orElse();
  }
}

abstract class _AddToken implements SlotMachineEvent {
  const factory _AddToken() = _$_AddToken;
}

/// @nodoc
abstract class _$RemoveTokenCopyWith<$Res> {
  factory _$RemoveTokenCopyWith(
          _RemoveToken value, $Res Function(_RemoveToken) then) =
      __$RemoveTokenCopyWithImpl<$Res>;
}

/// @nodoc
class __$RemoveTokenCopyWithImpl<$Res>
    extends _$SlotMachineEventCopyWithImpl<$Res>
    implements _$RemoveTokenCopyWith<$Res> {
  __$RemoveTokenCopyWithImpl(
      _RemoveToken _value, $Res Function(_RemoveToken) _then)
      : super(_value, (v) => _then(v as _RemoveToken));

  @override
  _RemoveToken get _value => super._value as _RemoveToken;
}

/// @nodoc
class _$_RemoveToken implements _RemoveToken {
  const _$_RemoveToken();

  @override
  String toString() {
    return 'SlotMachineEvent.removeToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RemoveToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() addToken,
    required TResult Function() removeToken,
    required TResult Function(int count) setTokenCount,
  }) {
    return removeToken();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? addToken,
    TResult Function()? removeToken,
    TResult Function(int count)? setTokenCount,
    required TResult orElse(),
  }) {
    if (removeToken != null) {
      return removeToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddToken value) addToken,
    required TResult Function(_RemoveToken value) removeToken,
    required TResult Function(_SetTokenCount value) setTokenCount,
  }) {
    return removeToken(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddToken value)? addToken,
    TResult Function(_RemoveToken value)? removeToken,
    TResult Function(_SetTokenCount value)? setTokenCount,
    required TResult orElse(),
  }) {
    if (removeToken != null) {
      return removeToken(this);
    }
    return orElse();
  }
}

abstract class _RemoveToken implements SlotMachineEvent {
  const factory _RemoveToken() = _$_RemoveToken;
}

/// @nodoc
abstract class _$SetTokenCountCopyWith<$Res> {
  factory _$SetTokenCountCopyWith(
          _SetTokenCount value, $Res Function(_SetTokenCount) then) =
      __$SetTokenCountCopyWithImpl<$Res>;
  $Res call({int count});
}

/// @nodoc
class __$SetTokenCountCopyWithImpl<$Res>
    extends _$SlotMachineEventCopyWithImpl<$Res>
    implements _$SetTokenCountCopyWith<$Res> {
  __$SetTokenCountCopyWithImpl(
      _SetTokenCount _value, $Res Function(_SetTokenCount) _then)
      : super(_value, (v) => _then(v as _SetTokenCount));

  @override
  _SetTokenCount get _value => super._value as _SetTokenCount;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(_SetTokenCount(
      count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_SetTokenCount implements _SetTokenCount {
  const _$_SetTokenCount(this.count);

  @override
  final int count;

  @override
  String toString() {
    return 'SlotMachineEvent.setTokenCount(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SetTokenCount &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$SetTokenCountCopyWith<_SetTokenCount> get copyWith =>
      __$SetTokenCountCopyWithImpl<_SetTokenCount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function() addToken,
    required TResult Function() removeToken,
    required TResult Function(int count) setTokenCount,
  }) {
    return setTokenCount(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function()? addToken,
    TResult Function()? removeToken,
    TResult Function(int count)? setTokenCount,
    required TResult orElse(),
  }) {
    if (setTokenCount != null) {
      return setTokenCount(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddToken value) addToken,
    required TResult Function(_RemoveToken value) removeToken,
    required TResult Function(_SetTokenCount value) setTokenCount,
  }) {
    return setTokenCount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddToken value)? addToken,
    TResult Function(_RemoveToken value)? removeToken,
    TResult Function(_SetTokenCount value)? setTokenCount,
    required TResult orElse(),
  }) {
    if (setTokenCount != null) {
      return setTokenCount(this);
    }
    return orElse();
  }
}

abstract class _SetTokenCount implements SlotMachineEvent {
  const factory _SetTokenCount(int count) = _$_SetTokenCount;

  int get count => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SetTokenCountCopyWith<_SetTokenCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SlotMachineStateTearOff {
  const _$SlotMachineStateTearOff();

  _SlotMachineState call({String? id, int? tokens, Object? error}) {
    return _SlotMachineState(
      id: id,
      tokens: tokens,
      error: error,
    );
  }
}

/// @nodoc
const $SlotMachineState = _$SlotMachineStateTearOff();

/// @nodoc
mixin _$SlotMachineState {
  String? get id => throw _privateConstructorUsedError;
  int? get tokens => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SlotMachineStateCopyWith<SlotMachineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotMachineStateCopyWith<$Res> {
  factory $SlotMachineStateCopyWith(
          SlotMachineState value, $Res Function(SlotMachineState) then) =
      _$SlotMachineStateCopyWithImpl<$Res>;
  $Res call({String? id, int? tokens, Object? error});
}

/// @nodoc
class _$SlotMachineStateCopyWithImpl<$Res>
    implements $SlotMachineStateCopyWith<$Res> {
  _$SlotMachineStateCopyWithImpl(this._value, this._then);

  final SlotMachineState _value;
  // ignore: unused_field
  final $Res Function(SlotMachineState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? tokens = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as int?,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
abstract class _$SlotMachineStateCopyWith<$Res>
    implements $SlotMachineStateCopyWith<$Res> {
  factory _$SlotMachineStateCopyWith(
          _SlotMachineState value, $Res Function(_SlotMachineState) then) =
      __$SlotMachineStateCopyWithImpl<$Res>;
  @override
  $Res call({String? id, int? tokens, Object? error});
}

/// @nodoc
class __$SlotMachineStateCopyWithImpl<$Res>
    extends _$SlotMachineStateCopyWithImpl<$Res>
    implements _$SlotMachineStateCopyWith<$Res> {
  __$SlotMachineStateCopyWithImpl(
      _SlotMachineState _value, $Res Function(_SlotMachineState) _then)
      : super(_value, (v) => _then(v as _SlotMachineState));

  @override
  _SlotMachineState get _value => super._value as _SlotMachineState;

  @override
  $Res call({
    Object? id = freezed,
    Object? tokens = freezed,
    Object? error = freezed,
  }) {
    return _then(_SlotMachineState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as int?,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
class _$_SlotMachineState implements _SlotMachineState {
  const _$_SlotMachineState({this.id, this.tokens, this.error});

  @override
  final String? id;
  @override
  final int? tokens;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SlotMachineState(id: $id, tokens: $tokens, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SlotMachineState &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.tokens, tokens) ||
                const DeepCollectionEquality().equals(other.tokens, tokens)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(tokens) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$SlotMachineStateCopyWith<_SlotMachineState> get copyWith =>
      __$SlotMachineStateCopyWithImpl<_SlotMachineState>(this, _$identity);
}

abstract class _SlotMachineState implements SlotMachineState {
  const factory _SlotMachineState({String? id, int? tokens, Object? error}) =
      _$_SlotMachineState;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  int? get tokens => throw _privateConstructorUsedError;
  @override
  Object? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SlotMachineStateCopyWith<_SlotMachineState> get copyWith =>
      throw _privateConstructorUsedError;
}
