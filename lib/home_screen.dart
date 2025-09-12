import 'package:flutter/material.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/global_di/app_dependency_injection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Home Screen - ${sl<EnvironmentConfigManager>().environmentName}'),
      ),
    );
  }
}
