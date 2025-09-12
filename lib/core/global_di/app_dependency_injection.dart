import 'package:get_it/get_it.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/utilities/enum_util.dart';

part 'app_flavor_di.dart';

/// [sl] is the singleton instance of [GetIt]
final GetIt sl = GetIt.instance;

/// [AppDependencyInjection] is a class that registers the core dependencies
class AppDependencyInjection {
  /// This registers the core dependencies
  ///
  /// [flavor] is the flavor of the app
  void registerCoreDependencies(String? flavor) {
    try {
      _registerAppFlavorDependencies(flavor: flavor);
    } catch (error) {
      rethrow;
    }
  }
}
