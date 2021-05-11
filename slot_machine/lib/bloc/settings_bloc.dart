import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../domain/casino_api_uri.dart';
import '../domain/id.dart';
import '../domain/name.dart';

part 'settings_bloc.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.save() = _Save;
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required TextEditingController url,
    required TextEditingController name,
    required TextEditingController symbolCount,
    Object? error,
  }) = _SettingsState;

  factory SettingsState.initial() {
    return SettingsState(
      url: TextEditingController(),
      name: TextEditingController(),
      symbolCount: TextEditingController(),
    );
  }
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.id,
    required this.name,
    required this.casinoApiUri,
    required this.logger,
  }) : super(SettingsState.initial());

  final Id id;
  final Name name;
  final CasinoApiUri casinoApiUri;
  final Logger logger;

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) {
    return event.when(
      save: _save,
    );
  }

  Stream<SettingsState> _save() async* {
    yield* _saveUrl(state.url.text);
    yield* _saveName(state.name.text);
  }

  Stream<SettingsState> _saveUrl(String url) async* {
    try {
      final newValue = Uri.tryParse(url);
      if (newValue == null) {
        throw 'Please enter a valid url';
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
        throw 'Please enter a name for this slot-machine';
      } else if (newName == await id()) {
        await name.set(newName);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save name $newName', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }
}
