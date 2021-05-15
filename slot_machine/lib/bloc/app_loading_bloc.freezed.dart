// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_loading_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppLoadingEventTearOff {
  const _$AppLoadingEventTearOff();

  _AppLoadingEvent load() {
    return const _AppLoadingEvent();
  }
}

/// @nodoc
const $AppLoadingEvent = _$AppLoadingEventTearOff();

/// @nodoc
mixin _$AppLoadingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppLoadingEvent value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppLoadingEvent value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLoadingEventCopyWith<$Res> {
  factory $AppLoadingEventCopyWith(
          AppLoadingEvent value, $Res Function(AppLoadingEvent) then) =
      _$AppLoadingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppLoadingEventCopyWithImpl<$Res>
    implements $AppLoadingEventCopyWith<$Res> {
  _$AppLoadingEventCopyWithImpl(this._value, this._then);

  final AppLoadingEvent _value;
  // ignore: unused_field
  final $Res Function(AppLoadingEvent) _then;
}

/// @nodoc
abstract class _$AppLoadingEventCopyWith<$Res> {
  factory _$AppLoadingEventCopyWith(
          _AppLoadingEvent value, $Res Function(_AppLoadingEvent) then) =
      __$AppLoadingEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$AppLoadingEventCopyWithImpl<$Res>
    extends _$AppLoadingEventCopyWithImpl<$Res>
    implements _$AppLoadingEventCopyWith<$Res> {
  __$AppLoadingEventCopyWithImpl(
      _AppLoadingEvent _value, $Res Function(_AppLoadingEvent) _then)
      : super(_value, (v) => _then(v as _AppLoadingEvent));

  @override
  _AppLoadingEvent get _value => super._value as _AppLoadingEvent;
}

/// @nodoc

class _$_AppLoadingEvent implements _AppLoadingEvent {
  const _$_AppLoadingEvent();

  @override
  String toString() {
    return 'AppLoadingEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AppLoadingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppLoadingEvent value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppLoadingEvent value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _AppLoadingEvent implements AppLoadingEvent {
  const factory _AppLoadingEvent() = _$_AppLoadingEvent;
}

/// @nodoc
class _$AppLoadingStateTearOff {
  const _$AppLoadingStateTearOff();

  _AppLoadingState call(
      {LoadingStage loadingStage = const LoadingStage.notLoaded(),
      Color color = Colors.blue,
      bool isDarkModeEnabled = false,
      Object? error}) {
    return _AppLoadingState(
      loadingStage: loadingStage,
      color: color,
      isDarkModeEnabled: isDarkModeEnabled,
      error: error,
    );
  }
}

/// @nodoc
const $AppLoadingState = _$AppLoadingStateTearOff();

/// @nodoc
mixin _$AppLoadingState {
  LoadingStage get loadingStage => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  bool get isDarkModeEnabled => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLoadingStateCopyWith<AppLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLoadingStateCopyWith<$Res> {
  factory $AppLoadingStateCopyWith(
          AppLoadingState value, $Res Function(AppLoadingState) then) =
      _$AppLoadingStateCopyWithImpl<$Res>;
  $Res call(
      {LoadingStage loadingStage,
      Color color,
      bool isDarkModeEnabled,
      Object? error});

  $LoadingStageCopyWith<$Res> get loadingStage;
}

/// @nodoc
class _$AppLoadingStateCopyWithImpl<$Res>
    implements $AppLoadingStateCopyWith<$Res> {
  _$AppLoadingStateCopyWithImpl(this._value, this._then);

  final AppLoadingState _value;
  // ignore: unused_field
  final $Res Function(AppLoadingState) _then;

  @override
  $Res call({
    Object? loadingStage = freezed,
    Object? color = freezed,
    Object? isDarkModeEnabled = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStage: loadingStage == freezed
          ? _value.loadingStage
          : loadingStage // ignore: cast_nullable_to_non_nullable
              as LoadingStage,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      isDarkModeEnabled: isDarkModeEnabled == freezed
          ? _value.isDarkModeEnabled
          : isDarkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }

  @override
  $LoadingStageCopyWith<$Res> get loadingStage {
    return $LoadingStageCopyWith<$Res>(_value.loadingStage, (value) {
      return _then(_value.copyWith(loadingStage: value));
    });
  }
}

/// @nodoc
abstract class _$AppLoadingStateCopyWith<$Res>
    implements $AppLoadingStateCopyWith<$Res> {
  factory _$AppLoadingStateCopyWith(
          _AppLoadingState value, $Res Function(_AppLoadingState) then) =
      __$AppLoadingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LoadingStage loadingStage,
      Color color,
      bool isDarkModeEnabled,
      Object? error});

  @override
  $LoadingStageCopyWith<$Res> get loadingStage;
}

/// @nodoc
class __$AppLoadingStateCopyWithImpl<$Res>
    extends _$AppLoadingStateCopyWithImpl<$Res>
    implements _$AppLoadingStateCopyWith<$Res> {
  __$AppLoadingStateCopyWithImpl(
      _AppLoadingState _value, $Res Function(_AppLoadingState) _then)
      : super(_value, (v) => _then(v as _AppLoadingState));

  @override
  _AppLoadingState get _value => super._value as _AppLoadingState;

  @override
  $Res call({
    Object? loadingStage = freezed,
    Object? color = freezed,
    Object? isDarkModeEnabled = freezed,
    Object? error = freezed,
  }) {
    return _then(_AppLoadingState(
      loadingStage: loadingStage == freezed
          ? _value.loadingStage
          : loadingStage // ignore: cast_nullable_to_non_nullable
              as LoadingStage,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      isDarkModeEnabled: isDarkModeEnabled == freezed
          ? _value.isDarkModeEnabled
          : isDarkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_AppLoadingState implements _AppLoadingState {
  const _$_AppLoadingState(
      {this.loadingStage = const LoadingStage.notLoaded(),
      this.color = Colors.blue,
      this.isDarkModeEnabled = false,
      this.error});

  @JsonKey(defaultValue: const LoadingStage.notLoaded())
  @override
  final LoadingStage loadingStage;
  @JsonKey(defaultValue: Colors.blue)
  @override
  final Color color;
  @JsonKey(defaultValue: false)
  @override
  final bool isDarkModeEnabled;
  @override
  final Object? error;

  @override
  String toString() {
    return 'AppLoadingState(loadingStage: $loadingStage, color: $color, isDarkModeEnabled: $isDarkModeEnabled, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppLoadingState &&
            (identical(other.loadingStage, loadingStage) ||
                const DeepCollectionEquality()
                    .equals(other.loadingStage, loadingStage)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.isDarkModeEnabled, isDarkModeEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkModeEnabled, isDarkModeEnabled)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loadingStage) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(isDarkModeEnabled) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$AppLoadingStateCopyWith<_AppLoadingState> get copyWith =>
      __$AppLoadingStateCopyWithImpl<_AppLoadingState>(this, _$identity);
}

abstract class _AppLoadingState implements AppLoadingState {
  const factory _AppLoadingState(
      {LoadingStage loadingStage,
      Color color,
      bool isDarkModeEnabled,
      Object? error}) = _$_AppLoadingState;

  @override
  LoadingStage get loadingStage => throw _privateConstructorUsedError;
  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  bool get isDarkModeEnabled => throw _privateConstructorUsedError;
  @override
  Object? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppLoadingStateCopyWith<_AppLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LoadingStageTearOff {
  const _$LoadingStageTearOff();

  _NotLoaded notLoaded() {
    return const _NotLoaded();
  }

  _RegisteringCore registeringCore() {
    return const _RegisteringCore();
  }

  _LoadingHive loadingHive() {
    return const _LoadingHive();
  }

  _InitializingDI initializingDI() {
    return const _InitializingDI();
  }

  _GettingId gettingId() {
    return const _GettingId();
  }

  _GettingTokenCount gettingTokenCount() {
    return const _GettingTokenCount();
  }

  _Loaded loaded() {
    return const _Loaded();
  }
}

/// @nodoc
const $LoadingStage = _$LoadingStageTearOff();

/// @nodoc
mixin _$LoadingStage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStageCopyWith<$Res> {
  factory $LoadingStageCopyWith(
          LoadingStage value, $Res Function(LoadingStage) then) =
      _$LoadingStageCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStageCopyWithImpl<$Res> implements $LoadingStageCopyWith<$Res> {
  _$LoadingStageCopyWithImpl(this._value, this._then);

  final LoadingStage _value;
  // ignore: unused_field
  final $Res Function(LoadingStage) _then;
}

/// @nodoc
abstract class _$NotLoadedCopyWith<$Res> {
  factory _$NotLoadedCopyWith(
          _NotLoaded value, $Res Function(_NotLoaded) then) =
      __$NotLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotLoadedCopyWithImpl<$Res> extends _$LoadingStageCopyWithImpl<$Res>
    implements _$NotLoadedCopyWith<$Res> {
  __$NotLoadedCopyWithImpl(_NotLoaded _value, $Res Function(_NotLoaded) _then)
      : super(_value, (v) => _then(v as _NotLoaded));

  @override
  _NotLoaded get _value => super._value as _NotLoaded;
}

/// @nodoc

class _$_NotLoaded implements _NotLoaded {
  const _$_NotLoaded();

  @override
  String toString() {
    return 'LoadingStage.notLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NotLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) {
    return notLoaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (notLoaded != null) {
      return notLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) {
    return notLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (notLoaded != null) {
      return notLoaded(this);
    }
    return orElse();
  }
}

abstract class _NotLoaded implements LoadingStage {
  const factory _NotLoaded() = _$_NotLoaded;
}

/// @nodoc
abstract class _$RegisteringCoreCopyWith<$Res> {
  factory _$RegisteringCoreCopyWith(
          _RegisteringCore value, $Res Function(_RegisteringCore) then) =
      __$RegisteringCoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$RegisteringCoreCopyWithImpl<$Res>
    extends _$LoadingStageCopyWithImpl<$Res>
    implements _$RegisteringCoreCopyWith<$Res> {
  __$RegisteringCoreCopyWithImpl(
      _RegisteringCore _value, $Res Function(_RegisteringCore) _then)
      : super(_value, (v) => _then(v as _RegisteringCore));

  @override
  _RegisteringCore get _value => super._value as _RegisteringCore;
}

/// @nodoc

class _$_RegisteringCore implements _RegisteringCore {
  const _$_RegisteringCore();

  @override
  String toString() {
    return 'LoadingStage.registeringCore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _RegisteringCore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) {
    return registeringCore();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (registeringCore != null) {
      return registeringCore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) {
    return registeringCore(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (registeringCore != null) {
      return registeringCore(this);
    }
    return orElse();
  }
}

abstract class _RegisteringCore implements LoadingStage {
  const factory _RegisteringCore() = _$_RegisteringCore;
}

/// @nodoc
abstract class _$LoadingHiveCopyWith<$Res> {
  factory _$LoadingHiveCopyWith(
          _LoadingHive value, $Res Function(_LoadingHive) then) =
      __$LoadingHiveCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingHiveCopyWithImpl<$Res> extends _$LoadingStageCopyWithImpl<$Res>
    implements _$LoadingHiveCopyWith<$Res> {
  __$LoadingHiveCopyWithImpl(
      _LoadingHive _value, $Res Function(_LoadingHive) _then)
      : super(_value, (v) => _then(v as _LoadingHive));

  @override
  _LoadingHive get _value => super._value as _LoadingHive;
}

/// @nodoc

class _$_LoadingHive implements _LoadingHive {
  const _$_LoadingHive();

  @override
  String toString() {
    return 'LoadingStage.loadingHive()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadingHive);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) {
    return loadingHive();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loadingHive != null) {
      return loadingHive();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loadingHive(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loadingHive != null) {
      return loadingHive(this);
    }
    return orElse();
  }
}

abstract class _LoadingHive implements LoadingStage {
  const factory _LoadingHive() = _$_LoadingHive;
}

/// @nodoc
abstract class _$InitializingDICopyWith<$Res> {
  factory _$InitializingDICopyWith(
          _InitializingDI value, $Res Function(_InitializingDI) then) =
      __$InitializingDICopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializingDICopyWithImpl<$Res>
    extends _$LoadingStageCopyWithImpl<$Res>
    implements _$InitializingDICopyWith<$Res> {
  __$InitializingDICopyWithImpl(
      _InitializingDI _value, $Res Function(_InitializingDI) _then)
      : super(_value, (v) => _then(v as _InitializingDI));

  @override
  _InitializingDI get _value => super._value as _InitializingDI;
}

/// @nodoc

class _$_InitializingDI implements _InitializingDI {
  const _$_InitializingDI();

  @override
  String toString() {
    return 'LoadingStage.initializingDI()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InitializingDI);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) {
    return initializingDI();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (initializingDI != null) {
      return initializingDI();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initializingDI(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initializingDI != null) {
      return initializingDI(this);
    }
    return orElse();
  }
}

abstract class _InitializingDI implements LoadingStage {
  const factory _InitializingDI() = _$_InitializingDI;
}

/// @nodoc
abstract class _$GettingIdCopyWith<$Res> {
  factory _$GettingIdCopyWith(
          _GettingId value, $Res Function(_GettingId) then) =
      __$GettingIdCopyWithImpl<$Res>;
}

/// @nodoc
class __$GettingIdCopyWithImpl<$Res> extends _$LoadingStageCopyWithImpl<$Res>
    implements _$GettingIdCopyWith<$Res> {
  __$GettingIdCopyWithImpl(_GettingId _value, $Res Function(_GettingId) _then)
      : super(_value, (v) => _then(v as _GettingId));

  @override
  _GettingId get _value => super._value as _GettingId;
}

/// @nodoc

class _$_GettingId implements _GettingId {
  const _$_GettingId();

  @override
  String toString() {
    return 'LoadingStage.gettingId()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GettingId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) {
    return gettingId();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (gettingId != null) {
      return gettingId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) {
    return gettingId(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (gettingId != null) {
      return gettingId(this);
    }
    return orElse();
  }
}

abstract class _GettingId implements LoadingStage {
  const factory _GettingId() = _$_GettingId;
}

/// @nodoc
abstract class _$GettingTokenCountCopyWith<$Res> {
  factory _$GettingTokenCountCopyWith(
          _GettingTokenCount value, $Res Function(_GettingTokenCount) then) =
      __$GettingTokenCountCopyWithImpl<$Res>;
}

/// @nodoc
class __$GettingTokenCountCopyWithImpl<$Res>
    extends _$LoadingStageCopyWithImpl<$Res>
    implements _$GettingTokenCountCopyWith<$Res> {
  __$GettingTokenCountCopyWithImpl(
      _GettingTokenCount _value, $Res Function(_GettingTokenCount) _then)
      : super(_value, (v) => _then(v as _GettingTokenCount));

  @override
  _GettingTokenCount get _value => super._value as _GettingTokenCount;
}

/// @nodoc

class _$_GettingTokenCount implements _GettingTokenCount {
  const _$_GettingTokenCount();

  @override
  String toString() {
    return 'LoadingStage.gettingTokenCount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GettingTokenCount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) {
    return gettingTokenCount();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (gettingTokenCount != null) {
      return gettingTokenCount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) {
    return gettingTokenCount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (gettingTokenCount != null) {
      return gettingTokenCount(this);
    }
    return orElse();
  }
}

abstract class _GettingTokenCount implements LoadingStage {
  const factory _GettingTokenCount() = _$_GettingTokenCount;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$LoadingStageCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded();

  @override
  String toString() {
    return 'LoadingStage.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function() registeringCore,
    required TResult Function() loadingHive,
    required TResult Function() initializingDI,
    required TResult Function() gettingId,
    required TResult Function() gettingTokenCount,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function()? registeringCore,
    TResult Function()? loadingHive,
    TResult Function()? initializingDI,
    TResult Function()? gettingId,
    TResult Function()? gettingTokenCount,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLoaded value) notLoaded,
    required TResult Function(_RegisteringCore value) registeringCore,
    required TResult Function(_LoadingHive value) loadingHive,
    required TResult Function(_InitializingDI value) initializingDI,
    required TResult Function(_GettingId value) gettingId,
    required TResult Function(_GettingTokenCount value) gettingTokenCount,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLoaded value)? notLoaded,
    TResult Function(_RegisteringCore value)? registeringCore,
    TResult Function(_LoadingHive value)? loadingHive,
    TResult Function(_InitializingDI value)? initializingDI,
    TResult Function(_GettingId value)? gettingId,
    TResult Function(_GettingTokenCount value)? gettingTokenCount,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements LoadingStage {
  const factory _Loaded() = _$_Loaded;
}
