import 'package:casino_shared/casino_shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings implements CasinoApiSettings {
  const AppSettings._();
  const factory AppSettings({
    required String apiUrl,
  }) = _AppSettings;

  @override
  Uri get apiUri => Uri.parse(apiUrl);
}
