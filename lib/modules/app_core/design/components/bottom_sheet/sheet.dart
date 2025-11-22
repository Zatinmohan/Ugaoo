import 'package:flutter/material.dart';
import 'package:stupid_simple_sheet/stupid_simple_sheet.dart';
import 'package:ugaoo/modules/app_core/design/components/sizebox/stem.dart';
import 'package:ugaoo/modules/app_core/design/components/widgets/blur_widget.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

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
  Color? barrierColor,
  Clip? clipBehavior,
  bool enableDrag = true,
  bool showDragHandler = true,
  bool isDismissible = true,
  bool useSafeArea = true,
}) async {
  return Navigator.of(context).push(
    StupidSimpleSheetRoute(
      callNavigatorUserGestureMethods: true,
      originateAboveBottomViewInset: true,
      barrierDismissible: isDismissible,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      barrierColor:
          barrierColor ?? context.color.disabled.withValues(alpha: 0.1),
      draggable: enableDrag,
      snappingConfig: SheetSnappingConfig.pixels(
        [
          context.screenHeight * 0.86,
          context.screenHeight * 0.86,
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(
            context.r(context.radius.large),
          ),
          topRight: Radius.circular(
            context.r(context.radius.large),
          ),
        ),
      ),
      child: Builder(builder: (context) {
        return BlurWidget(
          child: Material(
            color:
                backgroundColor ?? context.color.surface.withValues(alpha: 0.4),
            animateColor: true,
            clipBehavior: clipBehavior ?? Clip.antiAlias,
            borderOnForeground: false,
            child: SafeArea(
              top: false,
              bottom: useSafeArea,
              maintainBottomViewPadding: useSafeArea,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showDragHandler)
                    Padding(
                      padding: EdgeInsetsGeometry.only(
                        top: context.i(context.spacing.social),
                        bottom: context.i(context.spacing.personal),
                      ),
                      child: Container(
                        width: context.w(48),
                        height: context.w(6),
                        decoration: BoxDecoration(
                          color: context.color.disabled,
                          borderRadius: BorderRadius.circular(
                            context.radius.medium,
                          ),
                        ),
                      ),
                    ),
                  Flexible(child: body),
                  if (context.isOnScreenNavigationPresent) Stem.v.custom(88),
                ],
              ),
            ),
          ),
        );
      }),
    ),
  );
}
