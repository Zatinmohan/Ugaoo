import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/types/leaf.dart';
import 'package:ugaoo/modules/app_core/design/components/checkbox/types/sprout.dart';
import 'package:ugaoo/modules/app_core/design/components/switcher/types/tendril.dart';
import 'package:ugaoo/modules/app_core/design/components/text/types/bud.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/types/root.dart';
import 'package:ugaoo/modules/system_design_screen/system_design_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ugaoo'),
      ),
      body: const SystemDesignScreen(),
    );
  }
}
