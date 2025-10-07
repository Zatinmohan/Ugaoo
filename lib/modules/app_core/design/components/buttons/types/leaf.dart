import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/raw_button.dart';
import 'package:ugaoo/modules/app_core/design/components/text/types/bud.dart';
import 'package:ugaoo/modules/app_core/design/extensions/app_design_extension.dart';

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
    required this.onPressed,
    required this.isLoading,
    super.key,
  });

  /// Creates a primary button.
  factory Leaf.primary({
    required String label,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) =>
      _PrimaryButton(
        label: label,
        onPressed: onPressed,
        isLoading: isLoading,
      );

  /// Creates a secondary button.
  factory Leaf.secondary({
    required String label,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) =>
      _SecondaryButton(
        label: label,
        onPressed: onPressed,
        isLoading: isLoading,
      );

  /// Creates a link button.
  factory Leaf.link({
    required String label,
    required VoidCallback onPressed,
  }) =>
      _LinkButton(
        label: label,
        onPressed: onPressed,
      );

  /// The label of the button.
  final String label;

  /// The on pressed callback of the button.
  final VoidCallback onPressed;

  /// The is loading state of the button.
  final bool isLoading;
}
