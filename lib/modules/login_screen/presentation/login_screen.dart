import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/asset_manager/asset_manager.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/types/leaf.dart';
import 'package:ugaoo/modules/app_core/design/components/images/petal.dart';
import 'package:ugaoo/modules/app_core/design/components/sizebox/stem.dart';
import 'package:ugaoo/modules/app_core/design/components/text/types/bud.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/model/root_field_controller.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/types/root.dart';
import 'package:ugaoo/modules/app_core/design/components/widgets/blur_widget.dart';
import 'package:ugaoo/modules/app_core/design/components/widgets/common_scaffold_widget.dart';
import 'package:ugaoo/modules/app_core/design/components/widgets/dot_widget.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';
import 'package:ugaoo/modules/app_core/localisation/localisation.dart';

part 'widgets/login_info_widget.dart';
part 'widgets/login_terms_and_service_widget.dart';
part 'widgets/login_field_widget.dart';

/// [LoginScreen] is a class that represents the login screen.
class LoginScreen extends StatefulWidget {
  /// Constructor of [LoginScreen]
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final PhoneFieldController _phoneController;
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _phoneController = PhoneFieldController(
      textController: TextEditingController(),
      animationController: _animationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Petal.asset(
            width: context.screenWidth,
            height: context.screenHeight,
            fit: BoxFit.cover,
            AssetManager.getAsset(
              context,
              'login_background',
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.screenWidth,
              decoration: BoxDecoration(
                color: context.color.surface.withValues(alpha: 0.8),
                border: Border.all(
                  color: context.color.surface.withValues(alpha: 0.8),
                  width: context.sp(0.5),
                ),
                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(context.r(context.spacing.public - 4)),
                  topRight:
                      Radius.circular(context.r(context.spacing.public - 4)),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(context.r(context.spacing.public - 4)),
                  topRight:
                      Radius.circular(context.r(context.spacing.public - 4)),
                ),
                child: BlurWidget(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: context.i(context.padding.regular),
                      right: context.i(context.padding.regular),
                      top: context.i(context.padding.relaxed),
                      bottom: context.i(context.padding.compact),
                    ),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _LoginInfoWidget(),
                          Stem.h.social(),
                          _LoginFieldWidget(phoneController: _phoneController),
                          Stem.h.social(),
                          _LoginTermsAndServiceWidget(
                            onTermsOfServiceTap: () {},
                            onPrivacyPolicyTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
