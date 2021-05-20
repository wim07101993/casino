// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'theme_box.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeTypeTearOff {
  const _$ThemeTypeTearOff();

  _Numbers numbers() {
    return const _Numbers();
  }
}

/// @nodoc
const $ThemeType = _$ThemeTypeTearOff();

/// @nodoc
mixin _$ThemeType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() numbers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? numbers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Numbers value) numbers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Numbers value)? numbers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeTypeCopyWith<$Res> {
  factory $ThemeTypeCopyWith(ThemeType value, $Res Function(ThemeType) then) =
      _$ThemeTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThemeTypeCopyWithImpl<$Res> implements $ThemeTypeCopyWith<$Res> {
  _$ThemeTypeCopyWithImpl(this._value, this._then);

  final ThemeType _value;
  // ignore: unused_field
  final $Res Function(ThemeType) _then;
}

/// @nodoc
abstract class _$NumbersCopyWith<$Res> {
  factory _$NumbersCopyWith(_Numbers value, $Res Function(_Numbers) then) =
      __$NumbersCopyWithImpl<$Res>;
}

/// @nodoc
class __$NumbersCopyWithImpl<$Res> extends _$ThemeTypeCopyWithImpl<$Res>
    implements _$NumbersCopyWith<$Res> {
  __$NumbersCopyWithImpl(_Numbers _value, $Res Function(_Numbers) _then)
      : super(_value, (v) => _then(v as _Numbers));

  @override
  _Numbers get _value => super._value as _Numbers;
}

/// @nodoc

class _$_Numbers implements _Numbers {
  const _$_Numbers();

  @override
  String toString() {
    return 'ThemeType.numbers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Numbers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() numbers,
  }) {
    return numbers();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? numbers,
    required TResult orElse(),
  }) {
    if (numbers != null) {
      return numbers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Numbers value) numbers,
  }) {
    return numbers(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Numbers value)? numbers,
    required TResult orElse(),
  }) {
    if (numbers != null) {
      return numbers(this);
    }
    return orElse();
  }
}

abstract class _Numbers implements ThemeType {
  const factory _Numbers() = _$_Numbers;
}
