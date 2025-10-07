import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/types/leaf.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ugaoo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Leaf.primary(
              label: 'Primary Button',
              onPressed: () {
                setState(() {
                  isLoading = !isLoading;
                });
              },
              isLoading: isLoading,
            ),
            Leaf.secondary(
              label: 'Secondary Button',
              onPressed: () {},
              isLoading: isLoading,
            ),
            Leaf.link(
              label: 'Link Button',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
