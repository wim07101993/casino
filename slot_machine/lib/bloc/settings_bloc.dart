import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../domain/application_color.dart';
import '../domain/casino_api_uri.dart';
import '../domain/name.dart';
import '../settings/application_color_form_field.dart';
import '../settings/switch_form_field.dart';

part 'settings_bloc.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.save() = _Save;
  const factory SettingsEvent.load() = _Load;
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required TextEditingController apiUrl,
    required TextEditingController name,
    required TextEditingController symbolCount,
    required ColorPickerController applicationColor,
    required SwitchController isDarkModeEnabled,
    @Default(false) bool hasSaved,
    Object? error,
  }) = _SettingsState;

  factory SettingsState.initial() {
    return SettingsState(
      apiUrl: TextEditingController(),
      name: TextEditingController(),
      symbolCount: TextEditingController(),
      applicationColor: ColorPickerController(),
      isDarkModeEnabled: SwitchController(),
    );
  }
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.name,
    required this.casinoApiUri,
    required this.logger,
    required this.applicationColor,
  }) : super(SettingsState.initial()) {
    add(const SettingsEvent.load());
  }

  final Name name;
  final CasinoApiUri casinoApiUri;
  final Logger logger;
  final ApplicationColor applicationColor;

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) {
    return event.when(
      save: _save,
      load: _load,
    );
  }

  Stream<SettingsState> _save() async* {
    logger.i('saving new settings');
    yield state.copyWith(error: null, hasSaved: false);
    yield* _saveApiUrl(state.apiUrl.text);
    yield* _saveName(state.name.text);
    yield* _saveApplicationColor(state.applicationColor.value);
    yield state.copyWith(hasSaved: true);
  }

  Stream<SettingsState> _load() async* {
    try {
      yield state.copyWith(
        name: TextEditingController(text: await name()),
        apiUrl: TextEditingController(
          text: await casinoApiUri().then((e) => e.toString()),
        ),
        applicationColor: ColorPickerController(
          color: await applicationColor(),
        ),
      );
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

  Stream<SettingsState> _saveApplicationColor(Color newColor) async* {
    try {
      if (newColor != await applicationColor()) {
        await applicationColor.set(newColor);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save color $newColor', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }
}
