import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/extensions/app_design_extension.dart';

/// [RawButtonCustomPainter] is a class that extends [CustomPainter] to
///  paint the liquid wave on the button.
final class RawButtonCustomPainter extends CustomPainter {
  /// Constructor of [RawButtonCustomPainter] that requires:
  /// - [fillAnimation] is the animation that controls the vertical fill level
  /// of the liquid.
  /// - [context] is the context of the build.
  RawButtonCustomPainter({
    required this.waveController,
    required this.fillAnimation,
    required this.context,
  }) : super(repaint: fillAnimation);

  /// The animation that controls the vertical fill level of the liquid.
  final Animation<double> fillAnimation;

  /// The animation that controls the horizontal wave motion.
  final AnimationController waveController;

  /// The context of the build.
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final paintBack = Paint()
      ..shader = LinearGradient(
        colors: [
          context.semantics.accent.withValues(alpha: 0.3),
          context.semantics.secondary.withValues(alpha: 0.4),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final paintFront = Paint()
      ..shader = LinearGradient(
        colors: [
          context.semantics.accent.withValues(alpha: 0.6),
          context.semantics.secondary.withValues(alpha: 0.9),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    const waveHeight = 8.0;
    const maxAmplitude = waveHeight * 1.3;
    final startY = size.height - maxAmplitude;
    const endY = maxAmplitude;
    final travelDistance = startY - endY;
    final baseHeight = startY - (fillAnimation.value * travelDistance);

    final elapsedSeconds =
        waveController.lastElapsedDuration?.inMilliseconds ?? 0;
    final time = elapsedSeconds / 1000.0;

    _drawWave(
      canvas,
      size,
      paintBack,
      baseHeight,
      time,
      speedMultiplier: 0.8,
      amplitudeMultiplier: 1.3,
    );

    _drawWave(
      canvas,
      size,
      paintFront,
      baseHeight,
      time,
      speedMultiplier: 1.2,
      amplitudeMultiplier: 1,
    );
  }

  void _drawWave(
    Canvas canvas,
    Size size,
    Paint paint,
    double baseHeight,
    double time, {
    required double speedMultiplier,
    required double amplitudeMultiplier,
  }) {
    final path = Path();
    const waveHeight = 8.0;

    path.moveTo(0, baseHeight);

    for (double x = 0; x <= size.width; x++) {
      final y = baseHeight +
          math.sin((x / size.width * 2 * math.pi) + (time * speedMultiplier)) *
              waveHeight *
              amplitudeMultiplier;
      path.lineTo(x, y);
    }

    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RawButtonCustomPainter oldDelegate) {
    return true;
  }
}
