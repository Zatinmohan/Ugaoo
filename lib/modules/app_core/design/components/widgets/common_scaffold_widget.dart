import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

/// This widget is used to create a scaffold with common properties
class ScaffoldWidget extends StatelessWidget {
  /// This constructor is used to create a scaffold with common properties
  /// Requires:
  /// [body] - The body of the scaffold
  /// [appBar] - The app bar of the scaffold
  /// [bottomNavigationBar] - The bottom navigation bar of the scaffold
  /// [resizeToAvoidBottomInset] - Whether the scaffold should
  /// resize to avoid the bottom inset
  /// [backgroundColor] - The background color of the scaffold
  /// [extendBody] - Whether the scaffold should extend the body
  /// [extendBodyBehindAppBar] - Whether the scaffold should
  /// extend the body behind the app bar
  /// [enableTopSafeArea] - Whether the scaffold should enable the top safe area
  /// [enableBottomSafeArea] - Whether the scaffold should
  ///  enable the bottom safe area
  /// [drawer] - The drawer of the scaffold
  /// [onDrawerChanged] - The callback function to be
  /// called when the drawer changes
  /// [endDrawer] - The end drawer of the scaffold
  const ScaffoldWidget({
    super.key,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.extendBody,
    this.extendBodyBehindAppBar,
    this.enableTopSafeArea,
    this.enableBottomSafeArea,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.backgroundColor,
  });

  /// The body of the scaffold
  final Widget? body;

  /// The app bar of the scaffold
  final PreferredSizeWidget? appBar;

  /// The bottom navigation bar of the scaffold
  final Widget? bottomNavigationBar;

  /// Whether the scaffold should resize to avoid the bottom inset
  final bool? resizeToAvoidBottomInset;

  /// The background color of the scaffold
  final bool? extendBody;

  /// Whether the scaffold should extend the body behind the app bar
  final bool? extendBodyBehindAppBar;

  /// Whether the scaffold should enable the top safe area
  final bool? enableTopSafeArea;

  /// Whether the scaffold should enable the bottom safe area
  final bool? enableBottomSafeArea;

  /// The drawer of the scaffold
  final Widget? drawer;

  /// The callback function to be called when the drawer changes
  final DrawerCallback? onDrawerChanged;

  /// The end drawer of the scaffold
  final Widget? endDrawer;

  /// The background color of the scaffold
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: enableTopSafeArea ?? false,
      bottom: enableBottomSafeArea ?? false,
      child: Builder(builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: Scaffold(
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            backgroundColor: backgroundColor ?? context.color.background,
            extendBody: extendBody ?? false,
            extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
          ),
        );
      }),
    );
  }
}
