import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/raw_button_painter.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';
import 'package:ugaoo/modules/app_core/design/widgets/custom_animated_switcher.dart';

part '../raw_button.dart';

part 'primary_button.dart';
part 'secondary_button.dart';
part 'link_button.dart';

/// [Leaf] is a class that extends [StatelessWidget] to create a
/// leaf button.
@sealed
abstract class Leaf extends StatelessWidget {
  /// Constructor of [Leaf] that requires:
  /// - [label] is the label of the button.
  /// - [onPressed] is the on pressed callback of the button.
  /// - [isLoading] is the is loading state of the button.
  const Leaf({
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.semanticLabel,
    super.key,
  });

  /// Creates a primary button.
  factory Leaf.primary({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    String? semanticLabel,
  }) =>
      _PrimaryButton(
        label: label,
        onPressed: onPressed,
        isLoading: isLoading,
        semanticLabel: semanticLabel,
      );

  /// Creates a secondary button.
  factory Leaf.secondary({
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    String? semanticLabel,
  }) =>
      _SecondaryButton(
        label: label,
        onPressed: onPressed,
        isLoading: isLoading,
        semanticLabel: semanticLabel,
      );

  /// Creates a link button.
  factory Leaf.link({
    required String label,
    VoidCallback? onPressed,
    String? semanticLabel,
  }) =>
      _LinkButton(
        label: label,
        onPressed: onPressed,
        semanticLabel: semanticLabel,
      );

  /// The label of the button.
  final String label;

  /// The on pressed callback of the button.
  final VoidCallback? onPressed;

  /// The is loading state of the button.
  final bool isLoading;

  /// The semantic label of the button.
  final String? semanticLabel;
}
