import 'package:flutter/material.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/global_di/app_di.dart';
import 'package:ugaoo/core/router/models/routes_name.dart';
import 'package:ugaoo/modules/app_core/extensions/router_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Home Screen - ${sl<EnvironmentConfigManager>().environmentName}',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(Routes.second.name);
            },
            child: const Text('Go to Second Screen'),
          ),
        ],
      ),
    );
  }
}
