import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugaoo/core/global_di/app_dependency_injection.dart';
import 'package:ugaoo/home_screen.dart';

// Provided via: --dart-define=APP_FLAVOR=<dev|stg|prod>

void main() {
  AppDependencyInjection().registerCoreDependencies(appFlavor);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ugaoo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
