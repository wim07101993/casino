import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../local_db/general_box.dart';

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
    required this.generalBox,
    required this.logger,
  }) : super(SettingsState.initial());

  final GeneralBox generalBox;
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
    yield* _saveSymbolCount(state.symbolCount.text);
  }

  Stream<SettingsState> _saveUrl(String url) async* {
    try {
      final newValue = Uri.tryParse(url);
      if (newValue == null) {
        throw 'Please enter a valid url';
      } else if (newValue != await generalBox.casinoApiUri) {
        await generalBox.setCasinoApiUri(newValue);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save url $url', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  Stream<SettingsState> _saveName(String name) async* {
    try {
      if (name.isEmpty) {
        throw 'Please enter a name for this slot-machine';
      } else if (name == await generalBox.name) {
        await generalBox.setName(name);
      }
    } catch (e, stackTrace) {
      logger.e('Error on save name $name', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }

  Stream<SettingsState> _saveSymbolCount(String symbolCount) async* {
    try {
      final newValue = int.tryParse(symbolCount);
      if (newValue == null || newValue <= 0) {
        throw 'Please enter a symbol count greater than 0';
      } else if (newValue != await generalBox.numberOfSymbols) {
        await generalBox.setNumberOfSymbols(int.parse(symbolCount));
      }
    } catch (e, stackTrace) {
      logger.e('Error on save name $symbolCount', e, stackTrace);
      yield state.copyWith(error: e);
    }
  }
}
