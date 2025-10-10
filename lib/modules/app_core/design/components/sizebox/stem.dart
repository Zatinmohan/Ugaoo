import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part 'types/stem_custom.dart';
part 'types/stem_global.dart';
part 'types/stem_none.dart';
part 'types/stem_public.dart';
part 'types/stem_social.dart';
part 'types/stem_intimate.dart';
part 'types/stem_personal.dart';

/// [Stem] is a semantic spacing component for the Ugaoo design system.
///
/// It provides a consistent and theme-aware way to add space in layouts
/// using a clean, fluent API.
///
/// ---
///
/// ### USAGE:
///
/// **For Vertical Space:**
/// ```dart
/// Column(
///   children: [
///     Text('Top Content'),
///     Stem.v.social(), // Creates a vertical 'social' space
///     Text('Bottom Content'),
///   ],
/// )
/// ```
///
/// **For Horizontal Space:**
/// ```dart
/// Row(
///   children: [
///     Icon(Icons.eco),
///     Stem.h.intimate(), // Creates a horizontal 'intimate' space
///     Text('Ugaoo'),
///   ],
/// )
/// ```
@sealed
abstract class Stem extends StatelessWidget {
  /// Base constructor for Stem widgets.
  const Stem({super.key});

  /// Creates a space with zero size.
  factory Stem.none() => const _StemNone();

  /// Provides access to horizontal spacing methods.
  ///
  /// Usage: `Stem.h.social()`
  static const StemAxisBuilder h = StemAxisBuilder(Axis.horizontal);

  /// Provides access to vertical spacing methods.
  ///
  /// Usage: `Stem.v.social()`
  static const StemAxisBuilder v = StemAxisBuilder(Axis.vertical);
}

/// A builder class that provides methods for creating a [Stem] widget
/// with a specific axis and semantic size.
@immutable
final class StemAxisBuilder {
  /// The axis of the space to create (horizontal or vertical).
  final Axis axis;

  /// Creates a builder for a specific [axis].
  const StemAxisBuilder(this.axis);

  /// Creates a space with zero size.
  Stem none() => const _StemNone();

  /// Creates a space using the 'intimate' semantic token.
  /// This is the smallest gap, for tightly related elements.
  Stem intimate() => _StemIntimate(axis);

  /// Creates a space using the 'personal' semantic token.
  /// Used for small gaps between related elements.
  Stem personal() => _StemPersonal(axis);

  /// Creates a space using the 'social' semantic token.
  /// This is the default gap for most elements.
  Stem social() => _StemSocial(axis);

  /// Creates a space using the 'public' semantic token.
  /// Used for large visual separation between groups.
  Stem public() => _StemPublic(axis);

  /// Creates a space using the 'global' semantic token.
  /// This is the largest gap, for major page margins.
  Stem global() => _StemGlobal(axis);

  /// Creates a custom space with the specified [space] value.
  ///
  /// The [space] value is a raw, unscaled number that will be scaled
  /// using `context.w()` for horizontal or `context.h()` for vertical.
  Stem custom(double space) => _StemCustom(space, axis);
}
