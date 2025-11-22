import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';

/// Localisation class for easy localisation
class LocalisationHandler {
  /// Initialize easy localisation
  Future<void> initilise() async => EasyLocalization.ensureInitialized();

  /// Translation path
  final String translationPath = 'assets/data/translations';

  /// List of supported locales
  List<Locale> get supportedLocale => [
        const Locale('en', 'US'),
      ];
}
