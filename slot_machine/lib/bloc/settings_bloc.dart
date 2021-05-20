import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../domain/casino_api_uri.dart';
import '../domain/is_dark_mode_enabled.dart';
import '../domain/name.dart';
import '../domain/primary_color.dart';
import '../settings/color_form_field.dart';
import '../settings/switch_form_field.dart';

part 'settings_bloc.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.saveApplicationSettings() =
      _SaveApplicationSettings;
  const factory SettingsEvent.load() = _Load;
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required TextEditingController apiUrl,
    required TextEditingController name,
    required TextEditingController symbolCount,
    required ColorPickerController primaryColor,
    required SwitchController isDarkModeEnabled,
    @Default(false) bool hasSaved,
    Object? error,
  }) = _SettingsState;

  factory SettingsState.initial() {
    return SettingsState(
      apiUrl: TextEditingController(),
      name: TextEditingController(),
      symbolCount: TextEditingController(),
      primaryColor: ColorPickerController(),
      isDarkModeEnabled: SwitchController(),
    );
  }
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.name,
    required this.casinoApiUri,
    required this.logger,
    required this.primaryColor,
    required this.isDarkModeEnabled,
  }) : super(SettingsState.initial()) {
    state.primaryColor.addListener(_onPrimaryColorChanged);
    state.isDarkModeEnabled.addListener(_onIsDarkModeEnabledChanged);
    add(const SettingsEvent.load());
  }

  final Name name;
  final CasinoApiUri casinoApiUri;
  final Logger logger;
  final PrimaryColor primaryColor;
  final IsDarkModeEnabled isDarkModeEnabled;

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) {
    return event.when(
      saveApplicationSettings: _saveApplicationSettings,
      load: _load,
    );
  }

  Stream<SettingsState> _saveApplicationSettings() async* {
    logger.i('saving new settings');
    yield state.copyWith(error: null);
    yield* _saveApiUrl(state.apiUrl.text);
    yield* _saveName(state.name.text);
  }

  Stream<SettingsState> _load() async* {
    try {
      state.name.text = await name();
      state.apiUrl.text = await casinoApiUri().then((e) => e.toString());
      state.primaryColor.value = await primaryColor();
      state.isDarkModeEnabled.value = await isDarkModeEnabled();
    } catch (e, stackTrace) {
      logger.e('Error on load', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  Stream<SettingsState> _saveApiUrl(String url) async* {
    try {
      final newValue = Uri.tryParse(url);
      if (newValue == null) {
        throw 'URL must be valid!';
      } else if (newValue != await casinoApiUri()) {
        await casinoApiUri.set(newValue);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save url $url', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  Stream<SettingsState> _saveName(String newName) async* {
    try {
      if (newName.isEmpty) {
        throw 'Name cannot be empty!';
      } else if (newName != await name()) {
        await name.set(newName);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save name $newName', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  Stream<SettingsState> _saveApplicationColor(Color newColor) async* {}

  Future<void> _onPrimaryColorChanged() async {
    final newColor = state.primaryColor.value;
    try {
      if (newColor != await primaryColor()) {
        await primaryColor.set(newColor);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save color $newColor', e, stackTrace);
      emit(state.copyWith(error: e));
    }
  }

  Future<void> _onIsDarkModeEnabledChanged() async {
    final newValue = state.isDarkModeEnabled.value;
    try {
      if (newValue != await isDarkModeEnabled()) {
        await isDarkModeEnabled.set(newValue);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save is-dark-mode-enabled $newValue', e, stackTrace);
      emit(state.copyWith(error: e));
    }
  }
}
