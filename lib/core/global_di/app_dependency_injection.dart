import 'package:get_it/get_it.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/environment/environment_type.dart';
import 'package:ugaoo/utilities/enum_util.dart';

part 'app_flavor_di.dart';

final sl = GetIt.instance;

class AppDependencyInjection {
  void registerCoreDependencies(String? flavor) {
    try {
      _registerAppFlavorDependencies(flavor: flavor);
    } catch (error) {
      rethrow;
    }
  }
}
