import 'package:flutter/material.dart';
import 'package:ugaoo/core/environment/environment_config_manager.dart';
import 'package:ugaoo/core/global_di/app_di.dart';
import 'package:ugaoo/core/logger/log.dart';
import 'package:ugaoo/core/router/models/routes_name.dart';
import 'package:ugaoo/core/storage/manager/storage_manager.dart';
import 'package:ugaoo/modules/app_core/extensions/router_extension.dart';
import 'package:ugaoo/modules/app_core/realm_config/example.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Example? e;
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
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              sl<StorageManager>()
                  .realmStorageHandler
                  .write(
                    Example('1', 'yellow'),
                  )
                  .run();
            },
            child: const Text('Go to Second Screen'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final x = await sl<StorageManager>()
                  .realmStorageHandler
                  .read<Example>(
                    '1',
                  )
                  .run();

              x.fold(
                  (l) => log.e(l.message),
                  (r) => setState(() {
                        e = r;
                      }));
            },
            child: const Text('Read Example'),
          ),
          const SizedBox(height: 10),
          Text(e?.value ?? 'Nothing'),
        ],
      ),
    );
  }
}
