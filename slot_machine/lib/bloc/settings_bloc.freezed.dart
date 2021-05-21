// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

  _SaveApplicationSettings saveApplicationSettings() {
    return const _SaveApplicationSettings();
  }

  _Load load() {
    return const _Load();
  }
}

/// @nodoc
const $SettingsEvent = _$SettingsEventTearOff();

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveApplicationSettings,
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveApplicationSettings,
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveApplicationSettings value)
        saveApplicationSettings,
    required TResult Function(_Load value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveApplicationSettings value)? saveApplicationSettings,
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class _$SaveApplicationSettingsCopyWith<$Res> {
  factory _$SaveApplicationSettingsCopyWith(_SaveApplicationSettings value,
          $Res Function(_SaveApplicationSettings) then) =
      __$SaveApplicationSettingsCopyWithImpl<$Res>;
}

/// @nodoc
class __$SaveApplicationSettingsCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$SaveApplicationSettingsCopyWith<$Res> {
  __$SaveApplicationSettingsCopyWithImpl(_SaveApplicationSettings _value,
      $Res Function(_SaveApplicationSettings) _then)
      : super(_value, (v) => _then(v as _SaveApplicationSettings));

  @override
  _SaveApplicationSettings get _value =>
      super._value as _SaveApplicationSettings;
}

/// @nodoc

class _$_SaveApplicationSettings implements _SaveApplicationSettings {
  const _$_SaveApplicationSettings();

  @override
  String toString() {
    return 'SettingsEvent.saveApplicationSettings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SaveApplicationSettings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveApplicationSettings,
    required TResult Function() load,
  }) {
    return saveApplicationSettings();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveApplicationSettings,
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (saveApplicationSettings != null) {
      return saveApplicationSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveApplicationSettings value)
        saveApplicationSettings,
    required TResult Function(_Load value) load,
  }) {
    return saveApplicationSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveApplicationSettings value)? saveApplicationSettings,
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (saveApplicationSettings != null) {
      return saveApplicationSettings(this);
    }
    return orElse();
  }
}

abstract class _SaveApplicationSettings implements SettingsEvent {
  const factory _SaveApplicationSettings() = _$_SaveApplicationSettings;
}

/// @nodoc
abstract class _$LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) then) =
      __$LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(_Load _value, $Res Function(_Load) _then)
      : super(_value, (v) => _then(v as _Load));

  @override
  _Load get _value => super._value as _Load;
}

/// @nodoc

class _$_Load implements _Load {
  const _$_Load();

  @override
  String toString() {
    return 'SettingsEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saveApplicationSettings,
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saveApplicationSettings,
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
    required TResult Function(_SaveApplicationSettings value)
        saveApplicationSettings,
    required TResult Function(_Load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveApplicationSettings value)? saveApplicationSettings,
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements SettingsEvent {
  const factory _Load() = _$_Load;
}

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  _SettingsState call(
      {required TextEditingController apiUrl,
      required TextEditingController name,
      required TextEditingController symbolCount,
      required ColorPickerController primaryColor,
      required SwitchController isDarkModeEnabled,
      required ThemeSelectorController selectedThemeType,
      bool hasSaved = false,
      Object? error}) {
    return _SettingsState(
      apiUrl: apiUrl,
      name: name,
      symbolCount: symbolCount,
      primaryColor: primaryColor,
      isDarkModeEnabled: isDarkModeEnabled,
      selectedThemeType: selectedThemeType,
      hasSaved: hasSaved,
      error: error,
    );
  }
}

/// @nodoc
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  TextEditingController get apiUrl => throw _privateConstructorUsedError;
  TextEditingController get name => throw _privateConstructorUsedError;
  TextEditingController get symbolCount => throw _privateConstructorUsedError;
  ColorPickerController get primaryColor => throw _privateConstructorUsedError;
  SwitchController get isDarkModeEnabled => throw _privateConstructorUsedError;
  ThemeSelectorController get selectedThemeType =>
      throw _privateConstructorUsedError;
  bool get hasSaved => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController apiUrl,
      TextEditingController name,
      TextEditingController symbolCount,
      ColorPickerController primaryColor,
      SwitchController isDarkModeEnabled,
      ThemeSelectorController selectedThemeType,
      bool hasSaved,
      Object? error});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object? apiUrl = freezed,
    Object? name = freezed,
    Object? symbolCount = freezed,
    Object? primaryColor = freezed,
    Object? isDarkModeEnabled = freezed,
    Object? selectedThemeType = freezed,
    Object? hasSaved = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      symbolCount: symbolCount == freezed
          ? _value.symbolCount
          : symbolCount // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as ColorPickerController,
      isDarkModeEnabled: isDarkModeEnabled == freezed
          ? _value.isDarkModeEnabled
          : isDarkModeEnabled // ignore: cast_nullable_to_non_nullable
              as SwitchController,
      selectedThemeType: selectedThemeType == freezed
          ? _value.selectedThemeType
          : selectedThemeType // ignore: cast_nullable_to_non_nullable
              as ThemeSelectorController,
      hasSaved: hasSaved == freezed
          ? _value.hasSaved
          : hasSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
abstract class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
          _SettingsState value, $Res Function(_SettingsState) then) =
      __$SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController apiUrl,
      TextEditingController name,
      TextEditingController symbolCount,
      ColorPickerController primaryColor,
      SwitchController isDarkModeEnabled,
      ThemeSelectorController selectedThemeType,
      bool hasSaved,
      Object? error});
}

/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(
      _SettingsState _value, $Res Function(_SettingsState) _then)
      : super(_value, (v) => _then(v as _SettingsState));

  @override
  _SettingsState get _value => super._value as _SettingsState;

  @override
  $Res call({
    Object? apiUrl = freezed,
    Object? name = freezed,
    Object? symbolCount = freezed,
    Object? primaryColor = freezed,
    Object? isDarkModeEnabled = freezed,
    Object? selectedThemeType = freezed,
    Object? hasSaved = freezed,
    Object? error = freezed,
  }) {
    return _then(_SettingsState(
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      symbolCount: symbolCount == freezed
          ? _value.symbolCount
          : symbolCount // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      primaryColor: primaryColor == freezed
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as ColorPickerController,
      isDarkModeEnabled: isDarkModeEnabled == freezed
          ? _value.isDarkModeEnabled
          : isDarkModeEnabled // ignore: cast_nullable_to_non_nullable
              as SwitchController,
      selectedThemeType: selectedThemeType == freezed
          ? _value.selectedThemeType
          : selectedThemeType // ignore: cast_nullable_to_non_nullable
              as ThemeSelectorController,
      hasSaved: hasSaved == freezed
          ? _value.hasSaved
          : hasSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_SettingsState implements _SettingsState {
  const _$_SettingsState(
      {required this.apiUrl,
      required this.name,
      required this.symbolCount,
      required this.primaryColor,
      required this.isDarkModeEnabled,
      required this.selectedThemeType,
      this.hasSaved = false,
      this.error});

  @override
  final TextEditingController apiUrl;
  @override
  final TextEditingController name;
  @override
  final TextEditingController symbolCount;
  @override
  final ColorPickerController primaryColor;
  @override
  final SwitchController isDarkModeEnabled;
  @override
  final ThemeSelectorController selectedThemeType;
  @JsonKey(defaultValue: false)
  @override
  final bool hasSaved;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SettingsState(apiUrl: $apiUrl, name: $name, symbolCount: $symbolCount, primaryColor: $primaryColor, isDarkModeEnabled: $isDarkModeEnabled, selectedThemeType: $selectedThemeType, hasSaved: $hasSaved, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsState &&
            (identical(other.apiUrl, apiUrl) ||
                const DeepCollectionEquality().equals(other.apiUrl, apiUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.symbolCount, symbolCount) ||
                const DeepCollectionEquality()
                    .equals(other.symbolCount, symbolCount)) &&
            (identical(other.primaryColor, primaryColor) ||
                const DeepCollectionEquality()
                    .equals(other.primaryColor, primaryColor)) &&
            (identical(other.isDarkModeEnabled, isDarkModeEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkModeEnabled, isDarkModeEnabled)) &&
            (identical(other.selectedThemeType, selectedThemeType) ||
                const DeepCollectionEquality()
                    .equals(other.selectedThemeType, selectedThemeType)) &&
            (identical(other.hasSaved, hasSaved) ||
                const DeepCollectionEquality()
                    .equals(other.hasSaved, hasSaved)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(apiUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(symbolCount) ^
      const DeepCollectionEquality().hash(primaryColor) ^
      const DeepCollectionEquality().hash(isDarkModeEnabled) ^
      const DeepCollectionEquality().hash(selectedThemeType) ^
      const DeepCollectionEquality().hash(hasSaved) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required TextEditingController apiUrl,
      required TextEditingController name,
      required TextEditingController symbolCount,
      required ColorPickerController primaryColor,
      required SwitchController isDarkModeEnabled,
      required ThemeSelectorController selectedThemeType,
      bool hasSaved,
      Object? error}) = _$_SettingsState;

  @override
  TextEditingController get apiUrl => throw _privateConstructorUsedError;
  @override
  TextEditingController get name => throw _privateConstructorUsedError;
  @override
  TextEditingController get symbolCount => throw _privateConstructorUsedError;
  @override
  ColorPickerController get primaryColor => throw _privateConstructorUsedError;
  @override
  SwitchController get isDarkModeEnabled => throw _privateConstructorUsedError;
  @override
  ThemeSelectorController get selectedThemeType =>
      throw _privateConstructorUsedError;
  @override
  bool get hasSaved => throw _privateConstructorUsedError;
  @override
  Object? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
