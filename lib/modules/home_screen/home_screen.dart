import 'package:flutter/material.dart';
import 'package:ugaoo/modules/system_design_screen/system_design_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
