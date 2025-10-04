import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/config/route_config/router_extension.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Second Screen'),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Go back to home '),
          ),
        ],
      ),
    );
  }
}
