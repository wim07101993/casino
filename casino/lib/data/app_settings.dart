import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  const AppSettings._();
  const factory AppSettings({
    required String apiUrl,
  }) = _AppSettings;

  Uri get apiUri => Uri.parse(apiUrl);
}
