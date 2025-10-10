part of 'types/tendril.dart';

class _RawSwitcher extends StatelessWidget {
  const _RawSwitcher({
    required this.value,
    this.onChanged,
    this.semanticLabel,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? semanticLabel;

  Color? _getOverlayColor(BuildContext context, Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return context.color.primary.withValues(alpha: 0.08);
    }
    if (states.contains(WidgetState.pressed)) {
      return context.color.primary.withValues(alpha: 0.12);
    }
    return null;
  }

  Color _getThumbColor(BuildContext context, Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return context.color.disabled.withValues(alpha: 0.7);
    }
    // If the switch is selected (ON), the thumb is the surface color (white).
    if (states.contains(WidgetState.selected)) {
      return context.color.surface;
    }
    // By default (OFF), the thumb is the standard disabled color.
    return context.color.disabled;
  }

  Color _getTrackColor(BuildContext context, Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return context.color.disabled.withValues(alpha: 0.1);
    }
    // If the switch is selected (ON), the track is the primary brand color.
    if (states.contains(WidgetState.selected)) {
      return context.color.primary;
    }
    // By default (OFF), the track is a subtle gray.
    return context.color.disabled.withValues(alpha: 0.3);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      toggled: value,
      label: semanticLabel,
      child: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) => _getOverlayColor(context, states),
        ),
        thumbColor: WidgetStateProperty.resolveWith<Color?>(
          (states) => _getThumbColor(context, states),
        ),
        trackColor: WidgetStateProperty.resolveWith<Color?>(
          (states) => _getTrackColor(context, states),
        ),
      ),
    );
  }
}
