// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

class $AssetsDataGen {
  const $AssetsDataGen();

  /// Directory path: assets/data/json
  $AssetsDataJsonGen get json => const $AssetsDataJsonGen();

  /// Directory path: assets/data/translations
  $AssetsDataTranslationsGen get translations =>
      const $AssetsDataTranslationsGen();
}

class $AssetsDataJsonGen {
  const $AssetsDataJsonGen();

  /// File path: assets/data/json/country_code.json
  String get countryCode => 'assets/data/json/country_code.json';

  /// File path: assets/data/json/network_env_config.json
  String get networkEnvConfig => 'assets/data/json/network_env_config.json';

  /// List of all assets
  List<String> get values => [countryCode, networkEnvConfig];
}

class $AssetsDataTranslationsGen {
  const $AssetsDataTranslationsGen();

  /// File path: assets/data/translations/en-US.json
  String get enUS => 'assets/data/translations/en-US.json';

  /// List of all assets
  List<String> get values => [enUS];
}

class Assets {
  const Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
}
