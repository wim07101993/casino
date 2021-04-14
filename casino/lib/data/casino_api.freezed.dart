// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'casino_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlotMachine _$SlotMachineFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _SlotMachine.fromJson(json);
    case 'toAdd':
      return _ToAdd.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$SlotMachineTearOff {
  const _$SlotMachineTearOff();

  _SlotMachine call(
      {required String id, required String name, required int tokens}) {
    return _SlotMachine(
      id: id,
      name: name,
      tokens: tokens,
    );
  }

  _ToAdd toAdd(
      {required String? id, required String name, required int tokens}) {
    return _ToAdd(
      id: id,
      name: name,
      tokens: tokens,
    );
  }

  SlotMachine fromJson(Map<String, Object> json) {
    return SlotMachine.fromJson(json);
  }
}

/// @nodoc
const $SlotMachine = _$SlotMachineTearOff();

/// @nodoc
mixin _$SlotMachine {
  String get name => throw _privateConstructorUsedError;
  int get tokens => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, int tokens) $default, {
    required TResult Function(String? id, String name, int tokens) toAdd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, int tokens)? $default, {
    TResult Function(String? id, String name, int tokens)? toAdd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SlotMachine value) $default, {
    required TResult Function(_ToAdd value) toAdd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SlotMachine value)? $default, {
    TResult Function(_ToAdd value)? toAdd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotMachineCopyWith<SlotMachine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotMachineCopyWith<$Res> {
  factory $SlotMachineCopyWith(
          SlotMachine value, $Res Function(SlotMachine) then) =
      _$SlotMachineCopyWithImpl<$Res>;
  $Res call({String name, int tokens});
}

/// @nodoc
class _$SlotMachineCopyWithImpl<$Res> implements $SlotMachineCopyWith<$Res> {
  _$SlotMachineCopyWithImpl(this._value, this._then);

  final SlotMachine _value;
  // ignore: unused_field
  final $Res Function(SlotMachine) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SlotMachineCopyWith<$Res>
    implements $SlotMachineCopyWith<$Res> {
  factory _$SlotMachineCopyWith(
          _SlotMachine value, $Res Function(_SlotMachine) then) =
      __$SlotMachineCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, int tokens});
}

/// @nodoc
class __$SlotMachineCopyWithImpl<$Res> extends _$SlotMachineCopyWithImpl<$Res>
    implements _$SlotMachineCopyWith<$Res> {
  __$SlotMachineCopyWithImpl(
      _SlotMachine _value, $Res Function(_SlotMachine) _then)
      : super(_value, (v) => _then(v as _SlotMachine));

  @override
  _SlotMachine get _value => super._value as _SlotMachine;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_SlotMachine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SlotMachine implements _SlotMachine {
  const _$_SlotMachine(
      {required this.id, required this.name, required this.tokens});

  factory _$_SlotMachine.fromJson(Map<String, dynamic> json) =>
      _$_$_SlotMachineFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int tokens;

  @override
  String toString() {
    return 'SlotMachine(id: $id, name: $name, tokens: $tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SlotMachine &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tokens, tokens) ||
                const DeepCollectionEquality().equals(other.tokens, tokens)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tokens);

  @JsonKey(ignore: true)
  @override
  _$SlotMachineCopyWith<_SlotMachine> get copyWith =>
      __$SlotMachineCopyWithImpl<_SlotMachine>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, int tokens) $default, {
    required TResult Function(String? id, String name, int tokens) toAdd,
  }) {
    return $default(id, name, tokens);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, int tokens)? $default, {
    TResult Function(String? id, String name, int tokens)? toAdd,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, tokens);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SlotMachine value) $default, {
    required TResult Function(_ToAdd value) toAdd,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SlotMachine value)? $default, {
    TResult Function(_ToAdd value)? toAdd,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SlotMachineToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _SlotMachine implements SlotMachine {
  const factory _SlotMachine(
      {required String id,
      required String name,
      required int tokens}) = _$_SlotMachine;

  factory _SlotMachine.fromJson(Map<String, dynamic> json) =
      _$_SlotMachine.fromJson;

  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get tokens => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SlotMachineCopyWith<_SlotMachine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ToAddCopyWith<$Res> implements $SlotMachineCopyWith<$Res> {
  factory _$ToAddCopyWith(_ToAdd value, $Res Function(_ToAdd) then) =
      __$ToAddCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String name, int tokens});
}

/// @nodoc
class __$ToAddCopyWithImpl<$Res> extends _$SlotMachineCopyWithImpl<$Res>
    implements _$ToAddCopyWith<$Res> {
  __$ToAddCopyWithImpl(_ToAdd _value, $Res Function(_ToAdd) _then)
      : super(_value, (v) => _then(v as _ToAdd));

  @override
  _ToAdd get _value => super._value as _ToAdd;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_ToAdd(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ToAdd implements _ToAdd {
  const _$_ToAdd({required this.id, required this.name, required this.tokens});

  factory _$_ToAdd.fromJson(Map<String, dynamic> json) =>
      _$_$_ToAddFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final int tokens;

  @override
  String toString() {
    return 'SlotMachine.toAdd(id: $id, name: $name, tokens: $tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToAdd &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tokens, tokens) ||
                const DeepCollectionEquality().equals(other.tokens, tokens)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tokens);

  @JsonKey(ignore: true)
  @override
  _$ToAddCopyWith<_ToAdd> get copyWith =>
      __$ToAddCopyWithImpl<_ToAdd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, int tokens) $default, {
    required TResult Function(String? id, String name, int tokens) toAdd,
  }) {
    return toAdd(id, name, tokens);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, int tokens)? $default, {
    TResult Function(String? id, String name, int tokens)? toAdd,
    required TResult orElse(),
  }) {
    if (toAdd != null) {
      return toAdd(id, name, tokens);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SlotMachine value) $default, {
    required TResult Function(_ToAdd value) toAdd,
  }) {
    return toAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SlotMachine value)? $default, {
    TResult Function(_ToAdd value)? toAdd,
    required TResult orElse(),
  }) {
    if (toAdd != null) {
      return toAdd(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ToAddToJson(this)..['runtimeType'] = 'toAdd';
  }
}

abstract class _ToAdd implements SlotMachine {
  const factory _ToAdd(
      {required String? id,
      required String name,
      required int tokens}) = _$_ToAdd;

  factory _ToAdd.fromJson(Map<String, dynamic> json) = _$_ToAdd.fromJson;

  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get tokens => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ToAddCopyWith<_ToAdd> get copyWith => throw _privateConstructorUsedError;
}
