import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/asset_manager/asset_manager.dart';
import 'package:ugaoo/modules/app_core/design/components/images/petal.dart';
import 'package:ugaoo/modules/app_core/design/components/widgets/common_scaffold_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Stack(
        children: [
          Petal.asset(
            AssetManager.getAsset(
              context,
              'login_background',
            ),
          ),
        ],
      ),
    );
  }
}
