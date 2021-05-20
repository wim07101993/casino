// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'casino_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlotMachineDTO _$SlotMachineDTOFromJson(Map<String, dynamic> json) {
  return _SlotMachineDTO.fromJson(json);
}

/// @nodoc
class _$SlotMachineDTOTearOff {
  const _$SlotMachineDTOTearOff();

  _SlotMachineDTO call(
      {required String id, required String name, required int tokens}) {
    return _SlotMachineDTO(
      id: id,
      name: name,
      tokens: tokens,
    );
  }

  SlotMachineDTO fromJson(Map<String, Object> json) {
    return SlotMachineDTO.fromJson(json);
  }
}

/// @nodoc
const $SlotMachineDTO = _$SlotMachineDTOTearOff();

/// @nodoc
mixin _$SlotMachineDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotMachineDTOCopyWith<SlotMachineDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotMachineDTOCopyWith<$Res> {
  factory $SlotMachineDTOCopyWith(
          SlotMachineDTO value, $Res Function(SlotMachineDTO) then) =
      _$SlotMachineDTOCopyWithImpl<$Res>;
  $Res call({String id, String name, int tokens});
}

/// @nodoc
class _$SlotMachineDTOCopyWithImpl<$Res>
    implements $SlotMachineDTOCopyWith<$Res> {
  _$SlotMachineDTOCopyWithImpl(this._value, this._then);

  final SlotMachineDTO _value;
  // ignore: unused_field
  final $Res Function(SlotMachineDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_value.copyWith(
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

/// @nodoc
abstract class _$SlotMachineDTOCopyWith<$Res>
    implements $SlotMachineDTOCopyWith<$Res> {
  factory _$SlotMachineDTOCopyWith(
          _SlotMachineDTO value, $Res Function(_SlotMachineDTO) then) =
      __$SlotMachineDTOCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, int tokens});
}

/// @nodoc
class __$SlotMachineDTOCopyWithImpl<$Res>
    extends _$SlotMachineDTOCopyWithImpl<$Res>
    implements _$SlotMachineDTOCopyWith<$Res> {
  __$SlotMachineDTOCopyWithImpl(
      _SlotMachineDTO _value, $Res Function(_SlotMachineDTO) _then)
      : super(_value, (v) => _then(v as _SlotMachineDTO));

  @override
  _SlotMachineDTO get _value => super._value as _SlotMachineDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_SlotMachineDTO(
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

/// @nodoc
@JsonSerializable()
class _$_SlotMachineDTO implements _SlotMachineDTO {
  const _$_SlotMachineDTO(
      {required this.id, required this.name, required this.tokens});

  factory _$_SlotMachineDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_SlotMachineDTOFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int tokens;

  @override
  String toString() {
    return 'SlotMachineDTO(id: $id, name: $name, tokens: $tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SlotMachineDTO &&
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
  _$SlotMachineDTOCopyWith<_SlotMachineDTO> get copyWith =>
      __$SlotMachineDTOCopyWithImpl<_SlotMachineDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SlotMachineDTOToJson(this);
  }
}

abstract class _SlotMachineDTO implements SlotMachineDTO {
  const factory _SlotMachineDTO(
      {required String id,
      required String name,
      required int tokens}) = _$_SlotMachineDTO;

  factory _SlotMachineDTO.fromJson(Map<String, dynamic> json) =
      _$_SlotMachineDTO.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get tokens => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SlotMachineDTOCopyWith<_SlotMachineDTO> get copyWith =>
      throw _privateConstructorUsedError;
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
}

/// @nodoc
const $SlotMachine = _$SlotMachineTearOff();

/// @nodoc
mixin _$SlotMachine {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get tokens => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SlotMachineCopyWith<SlotMachine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotMachineCopyWith<$Res> {
  factory $SlotMachineCopyWith(
          SlotMachine value, $Res Function(SlotMachine) then) =
      _$SlotMachineCopyWithImpl<$Res>;
  $Res call({String id, String name, int tokens});
}

/// @nodoc
class _$SlotMachineCopyWithImpl<$Res> implements $SlotMachineCopyWith<$Res> {
  _$SlotMachineCopyWithImpl(this._value, this._then);

  final SlotMachine _value;
  // ignore: unused_field
  final $Res Function(SlotMachine) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_value.copyWith(
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

/// @nodoc

class _$_SlotMachine implements _SlotMachine {
  const _$_SlotMachine(
      {required this.id, required this.name, required this.tokens});

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
}

abstract class _SlotMachine implements SlotMachine {
  const factory _SlotMachine(
      {required String id,
      required String name,
      required int tokens}) = _$_SlotMachine;

  @override
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
class _$CasinoApiExceptionTearOff {
  const _$CasinoApiExceptionTearOff();

  _NotFound notFound({required String message}) {
    return _NotFound(
      message: message,
    );
  }

  _InvalidRequest invalidRequest({required String message}) {
    return _InvalidRequest(
      message: message,
    );
  }

  _ClientError clientError({required String message}) {
    return _ClientError(
      message: message,
    );
  }

  _ServerError serverError({required String message}) {
    return _ServerError(
      message: message,
    );
  }
}

/// @nodoc
const $CasinoApiException = _$CasinoApiExceptionTearOff();

/// @nodoc
mixin _$CasinoApiException {
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notFound,
    required TResult Function(String message) invalidRequest,
    required TResult Function(String message) clientError,
    required TResult Function(String message) serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notFound,
    TResult Function(String message)? invalidRequest,
    TResult Function(String message)? clientError,
    TResult Function(String message)? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InvalidRequest value) invalidRequest,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InvalidRequest value)? invalidRequest,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CasinoApiExceptionCopyWith<CasinoApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CasinoApiExceptionCopyWith<$Res> {
  factory $CasinoApiExceptionCopyWith(
          CasinoApiException value, $Res Function(CasinoApiException) then) =
      _$CasinoApiExceptionCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$CasinoApiExceptionCopyWithImpl<$Res>
    implements $CasinoApiExceptionCopyWith<$Res> {
  _$CasinoApiExceptionCopyWithImpl(this._value, this._then);

  final CasinoApiException _value;
  // ignore: unused_field
  final $Res Function(CasinoApiException) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NotFoundCopyWith<$Res>
    implements $CasinoApiExceptionCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) then) =
      __$NotFoundCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$NotFoundCopyWithImpl<$Res>
    extends _$CasinoApiExceptionCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(_NotFound _value, $Res Function(_NotFound) _then)
      : super(_value, (v) => _then(v as _NotFound));

  @override
  _NotFound get _value => super._value as _NotFound;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_NotFound(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotFound implements _NotFound {
  const _$_NotFound({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CasinoApiException.notFound(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotFound &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$NotFoundCopyWith<_NotFound> get copyWith =>
      __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notFound,
    required TResult Function(String message) invalidRequest,
    required TResult Function(String message) clientError,
    required TResult Function(String message) serverError,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notFound,
    TResult Function(String message)? invalidRequest,
    TResult Function(String message)? clientError,
    TResult Function(String message)? serverError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InvalidRequest value) invalidRequest,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InvalidRequest value)? invalidRequest,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements CasinoApiException {
  const factory _NotFound({required String message}) = _$_NotFound;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotFoundCopyWith<_NotFound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$InvalidRequestCopyWith<$Res>
    implements $CasinoApiExceptionCopyWith<$Res> {
  factory _$InvalidRequestCopyWith(
          _InvalidRequest value, $Res Function(_InvalidRequest) then) =
      __$InvalidRequestCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$InvalidRequestCopyWithImpl<$Res>
    extends _$CasinoApiExceptionCopyWithImpl<$Res>
    implements _$InvalidRequestCopyWith<$Res> {
  __$InvalidRequestCopyWithImpl(
      _InvalidRequest _value, $Res Function(_InvalidRequest) _then)
      : super(_value, (v) => _then(v as _InvalidRequest));

  @override
  _InvalidRequest get _value => super._value as _InvalidRequest;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_InvalidRequest(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InvalidRequest implements _InvalidRequest {
  const _$_InvalidRequest({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CasinoApiException.invalidRequest(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvalidRequest &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$InvalidRequestCopyWith<_InvalidRequest> get copyWith =>
      __$InvalidRequestCopyWithImpl<_InvalidRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notFound,
    required TResult Function(String message) invalidRequest,
    required TResult Function(String message) clientError,
    required TResult Function(String message) serverError,
  }) {
    return invalidRequest(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notFound,
    TResult Function(String message)? invalidRequest,
    TResult Function(String message)? clientError,
    TResult Function(String message)? serverError,
    required TResult orElse(),
  }) {
    if (invalidRequest != null) {
      return invalidRequest(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InvalidRequest value) invalidRequest,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return invalidRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InvalidRequest value)? invalidRequest,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (invalidRequest != null) {
      return invalidRequest(this);
    }
    return orElse();
  }
}

abstract class _InvalidRequest implements CasinoApiException {
  const factory _InvalidRequest({required String message}) = _$_InvalidRequest;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InvalidRequestCopyWith<_InvalidRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ClientErrorCopyWith<$Res>
    implements $CasinoApiExceptionCopyWith<$Res> {
  factory _$ClientErrorCopyWith(
          _ClientError value, $Res Function(_ClientError) then) =
      __$ClientErrorCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$ClientErrorCopyWithImpl<$Res>
    extends _$CasinoApiExceptionCopyWithImpl<$Res>
    implements _$ClientErrorCopyWith<$Res> {
  __$ClientErrorCopyWithImpl(
      _ClientError _value, $Res Function(_ClientError) _then)
      : super(_value, (v) => _then(v as _ClientError));

  @override
  _ClientError get _value => super._value as _ClientError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ClientError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ClientError implements _ClientError {
  const _$_ClientError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CasinoApiException.clientError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ClientErrorCopyWith<_ClientError> get copyWith =>
      __$ClientErrorCopyWithImpl<_ClientError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notFound,
    required TResult Function(String message) invalidRequest,
    required TResult Function(String message) clientError,
    required TResult Function(String message) serverError,
  }) {
    return clientError(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notFound,
    TResult Function(String message)? invalidRequest,
    TResult Function(String message)? clientError,
    TResult Function(String message)? serverError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InvalidRequest value) invalidRequest,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return clientError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InvalidRequest value)? invalidRequest,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(this);
    }
    return orElse();
  }
}

abstract class _ClientError implements CasinoApiException {
  const factory _ClientError({required String message}) = _$_ClientError;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientErrorCopyWith<_ClientError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ServerErrorCopyWith<$Res>
    implements $CasinoApiExceptionCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    extends _$CasinoApiExceptionCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ServerError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CasinoApiException.serverError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServerError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notFound,
    required TResult Function(String message) invalidRequest,
    required TResult Function(String message) clientError,
    required TResult Function(String message) serverError,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notFound,
    TResult Function(String message)? invalidRequest,
    TResult Function(String message)? clientError,
    TResult Function(String message)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_InvalidRequest value) invalidRequest,
    required TResult Function(_ClientError value) clientError,
    required TResult Function(_ServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_InvalidRequest value)? invalidRequest,
    TResult Function(_ClientError value)? clientError,
    TResult Function(_ServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements CasinoApiException {
  const factory _ServerError({required String message}) = _$_ServerError;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServerErrorCopyWith<_ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}
