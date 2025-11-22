import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/images/petal.dart';

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
      body: Column(
        children: [
          Petal.network(
            'https://images.unsplash.com/photo-1761839257658-23502c67f6d5?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
