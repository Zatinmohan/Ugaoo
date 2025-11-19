import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/app_design_extension.dart';

/// Displays a customizable modal bottom sheet with various
/// configuration options.
///
/// This function wraps Flutter’s [showModalBottomSheet] and
/// provides a simpler API
/// for displaying a bottom sheet with optional animations, custom colors,
/// and drag behavior.
///
/// Type parameter [T] defines the value returned when the sheet is dismissed.
///
/// Returns a [Future] that completes with the value passed to [Navigator.pop]
/// when the bottom sheet is closed.

Future<T?> showSheet<T>(
  BuildContext context, {
  required Widget body,
  Color? backgroundColor,
  Color? barierColor,
  Clip? clipBehavior,
  bool isScrollControlled = false,
  bool enableDrag = true,
  bool showDragHandler = true,
  bool isDismissible = true,
  AnimationStyle? animationStyle,
  AnimationController? animationController,
  bool? requestFocus,
  bool useSafeArea = true,
  bool wrapContent = false,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
    barrierColor: barierColor,
    clipBehavior: clipBehavior,
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    showDragHandle: showDragHandler,
    isDismissible: isDismissible,
    sheetAnimationStyle: animationStyle,
    transitionAnimationController: animationController,
    requestFocus: requestFocus,
    useSafeArea: useSafeArea,
    builder: (sheetContext) {
      return SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: isScrollControlled
                ? sheetContext.screenHeight * 0.8
                : sheetContext.screenHeight,
          ),
          child: wrapContent ? body : Align(child: body),
        ),
        // child: wrapContent
        //     ? Align(
        //         child: body,
        //       )
        //     : ConstrainedBox(
        //         constraints: BoxConstraints(
        //           maxHeight: sheetContext.screenHeight * 0.8,
        //         ),
        //         child: body,
        //       ),
      );
    },
  );
}
