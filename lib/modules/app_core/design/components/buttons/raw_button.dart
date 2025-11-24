part of '../buttons/types/leaf.dart';

/// [RawButton] is a class that extends [StatefulWidget] to create a
/// liquid button.
class RawButton extends StatefulWidget {
  /// Constructor of [RawButton] that requires:
  /// - [label] is the label of the button.
  /// - [onPressed] is the on pressed callback of the button.
  /// - [isLoading] is the is loading state of the button.
  const RawButton({
    required this.label,
    required this.buttonSize,
    required this.padding,
    required this.buttonRadius,
    required this.buttonColor,
    required this.buttonBorder,
    required this.textStyle,
    required this.showDisableState,
    this.onPressed,
    this.isLoading = false,
    this.semanticLabel,
    super.key,
  });

  /// The label of the button.
  final String label;

  /// The on pressed callback of the button.
  final VoidCallback? onPressed;

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

  /// The semantic label of the button.
  final String? semanticLabel;

  /// The show disable state of the button.
  final bool showDisableState;

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
    );

    fillController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fillAnimation = CurvedAnimation(
      parent: fillController,
      curve: Curves.easeInOutSine,
    );

    if (widget.isLoading) {
      waveController.repeat();
      fillController.repeat(reverse: true);
    }
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
    final isDisabled = widget.onPressed == null && widget.showDisableState;
    final effectiveButtonColor = isDisabled
        ? context.color.disabled.withValues(alpha: 0.3)
        : (widget.isLoading
            ? widget.buttonColor.withValues(alpha: 0.9)
            : widget.buttonColor);

    final effectiveBorder = isDisabled
        ? Border.all(
            color: context.color.disabled.withValues(alpha: 0.3),
            width: widget.buttonBorder.top.width,
          )
        : widget.buttonBorder;

    final effectiveTextStyle = isDisabled
        ? widget.textStyle.copyWith(
            color: context.color.disabled.withValues(alpha: 0.7),
          )
        : widget.textStyle;

    final effectiveSplashColor = isDisabled
        ? Colors.transparent
        : effectiveButtonColor.withValues(alpha: 0.2);
    return Semantics(
      button: true,
      enabled: !isDisabled,
      label: widget.semanticLabel,
      child: InkWell(
        splashColor: effectiveSplashColor,
        borderRadius: BorderRadius.circular(context.i(widget.buttonRadius)),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          width: widget.buttonSize.width == 0
              ? null
              : context.w(widget.buttonSize.width),
          height: context.h(widget.buttonSize.height),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: effectiveButtonColor,
            borderRadius: BorderRadius.circular(context.i(widget.buttonRadius)),
            border: effectiveBorder,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(context.i(widget.buttonRadius)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Bloom(
                    duration: const Duration(milliseconds: 500),
                    child: widget.isLoading && !isDisabled
                        ? CustomPaint(
                            painter: RawButtonCustomPainter(
                              fillAnimation: fillAnimation,
                              waveController: waveController,
                              context: context,
                            ),
                            child: const SizedBox.expand(),
                          )
                        : const SizedBox.expand(),
                  ),
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
                        style: effectiveTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
