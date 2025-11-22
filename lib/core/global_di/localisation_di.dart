part of 'app_di.dart';

void _registerLocalisationDependencies() {
  sl.registerLazySingleton<LocalisationHandler>(LocalisationHandler.new);
  log.i('Localisation DI registered');
}
