import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/raw_button_painter.dart';
import 'package:ugaoo/modules/app_core/design/components/sizebox/stem.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';
import 'package:ugaoo/modules/app_core/design/widgets/custom_animated_switcher.dart';

/// [RawButton] is a class that extends [StatefulWidget] to create a
/// liquid button.
class RawButton extends StatefulWidget {
  /// Constructor of [RawButton] that requires:
  /// - [label] is the label of the button.
  /// - [onPressed] is the on pressed callback of the button.
  /// - [isLoading] is the is loading state of the button.
  const RawButton({
    required this.label,
    required this.onPressed,
    required this.buttonSize,
    required this.padding,
    required this.buttonRadius,
    required this.buttonColor,
    required this.buttonBorder,
    required this.textStyle,
    this.isLoading = false,
    super.key,
  });

  /// The label of the button.
  final String label;

  /// The on pressed callback of the button.
  final VoidCallback onPressed;

  /// The is loading state of the button.
  final bool isLoading;

  /// The size of the button.
  final Size buttonSize;

  /// The padding of the button.
  final EdgeInsetsGeometry padding;

  /// The radius of the button.
  final double buttonRadius;

  /// The color of the button.
  final Color buttonColor;

  /// The border of the button.
  final Border buttonBorder;

  /// The text style of the button.
  final TextStyle textStyle;

  @override
  State<RawButton> createState() => _RawButtonState();
}

class _RawButtonState extends State<RawButton> with TickerProviderStateMixin {
  late final AnimationController waveController;
  late final AnimationController fillController;
  late final Animation<double> fillAnimation;

  @override
  void initState() {
    super.initState();
    waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    fillController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    fillAnimation = CurvedAnimation(
      parent: fillController,
      curve: Curves.easeInOutSine,
    );
  }

  @override
  void didUpdateWidget(covariant RawButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading && !oldWidget.isLoading) {
      fillController.repeat(reverse: true);
    } else if (!widget.isLoading && oldWidget.isLoading) {
      fillController.stop();
    }
  }

  @override
  void dispose() {
    waveController.dispose();
    fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the button should be interactive.
    // final bool isDisabled = widget.isLoading || widget.onPressed == null;

    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        width: widget.buttonSize.width == 0
            ? null
            : context.w(widget.buttonSize.width),
        height: context.h(widget.buttonSize.height),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: widget.isLoading
              ? widget.buttonColor.withValues(alpha: 0.9)
              : widget.buttonColor,
          borderRadius: BorderRadius.circular(context.i(widget.buttonRadius)),
          border: widget.buttonBorder,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.i(widget.buttonRadius)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Bloom(
                duration: const Duration(milliseconds: 500),
                child: widget.isLoading
                    ? CustomPaint(
                        painter: RawButtonCustomPainter(
                          fillAnimation: fillAnimation,
                          waveController: waveController,
                          context: context,
                        ),
                        child: const SizedBox.expand(),
                      )
                    : Stem.none(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.i(widget.padding.horizontal),
                    ),
                    child: Text(
                      widget.label,
                      style: widget.textStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
