import 'package:flutter/material.dart';

/// Base controller for root text fields that can optionally expose an
/// [AnimationController] for visual feedback (e.g., shake, highlight).
///
/// Ownership:
/// - Callers provide and own the lifecycle of [animationController].
/// - Subclasses typically also carry a [TextEditingController] that must be
///   created and disposed by the caller (e.g., in a StatefulWidget).
sealed class RootFieldController {
  RootFieldController({
    this.animationController,
  });

  /// Optional controller for animating UI feedback associated with the field.
  final AnimationController? animationController;
}

/// Controller for a standard text field.
///
/// Holds a [TextEditingController] for general-purpose input while still
/// allowing optional animations via the base [animationController].
class DefaultRootFieldController extends RootFieldController {
  /// Creates a controller for a default text field.
  ///
  /// The caller owns and must dispose [controller].
  DefaultRootFieldController({
    required this.controller,
    super.animationController,
  });

  /// Text controller backing the default text field.
  final TextEditingController controller;
}

/// Controller for an OTP/PIN-style text field.
///
/// This mirrors [DefaultRootFieldController] but is semantically scoped to
/// one-time codes. Pair with input formatters, maxLength, and monospace fonts
/// as appropriate for your OTP UI.
class OtpRootFieldController extends RootFieldController {
  /// Creates a controller for an OTP/PIN text field.
  ///
  /// The caller owns and must dispose [controller].
  OtpRootFieldController({
    required this.controller,
    super.animationController,
  });

  /// Text controller backing the OTP field.
  final TextEditingController controller;
}
