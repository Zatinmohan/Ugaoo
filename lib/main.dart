import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugaoo/core/global_di/app_di.dart';
import 'package:ugaoo/core/router/manager/router_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencyInjection().registerCoreDependencies(appFlavor);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ugaoo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        hintColor: Color(0xfffffff),
      ),
      routerConfig: sl.get<RouterManager>().routerConfig,
    );
  }
}
