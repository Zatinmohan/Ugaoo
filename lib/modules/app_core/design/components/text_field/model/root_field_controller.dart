import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/types/phone_field/models/country_code_model.dart';

/// Base controller for root text fields that can optionally expose an
/// [AnimationController] for visual feedback (e.g., shake, highlight).
///
/// Ownership:
/// - Callers provide and own the lifecycle of [animationController].
/// - Subclasses typically also carry a [TextEditingController] that must be
///   created and disposed by the caller (e.g., in a StatefulWidget).
sealed class RootFieldController {
  RootFieldController({
    required this.textController,
    this.animationController,
  });

  /// Optional controller for animating UI feedback associated with the field.
  final AnimationController? animationController;

  /// Text controller backing the phone number field.
  final TextEditingController textController;
}

/// Controller for a standard text field.
///
/// Holds a [TextEditingController] for general-purpose input while still
/// allowing optional animations via the base [animationController].
class DefaultRootFieldController extends RootFieldController {
  /// Creates a controller for a default text field.
  DefaultRootFieldController({
    required super.textController,
    super.animationController,
  });
}

/// Controller for an OTP/PIN-style text field.
///
/// This mirrors [DefaultRootFieldController] but is semantically scoped to
/// one-time codes. Pair with input formatters, maxLength, and monospace fonts
/// as appropriate for your OTP UI.
class OtpRootFieldController extends RootFieldController {
  /// Creates a controller for an OTP/PIN text field.
  OtpRootFieldController({
    required super.textController,
    super.animationController,
  });
}

/// Controller for a phone number text field.
class PhoneFieldController extends RootFieldController {
  /// Creates a controller for a phone number text field requires:
  /// - [selectedCountryCode] is the currently selected country code.
  PhoneFieldController({
    required super.textController,
    this.selectedCountryCode,
    super.animationController,
  });

  /// Currently selected country code.
  final CountryCodeModel? selectedCountryCode;
}
