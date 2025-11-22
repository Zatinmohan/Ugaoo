part of 'app_di.dart';

Future<void> _assetManagerDi() async {
  try {
    await AssetManager.configure();
    log.i('AssetManager configured successfully');
  } catch (e, s) {
    log.e(
      'Error configuring AssetManager',
      config: LoggerModel(
        exception: e,
        stackTrace: s,
        name: 'Asset Manager',
      ),
    );
    rethrow;
  }
}
