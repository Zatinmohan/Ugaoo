import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

part 'types/stem_custom.dart';
part 'types/stem_global.dart';
part 'types/stem.none.dart';
part 'types/stem_public.dart';
part 'types/stem_social.dart';
part 'types/stem_intimate.dart';
part 'types/stem_personal.dart';

/// [Stem] is a class that extends [StatelessWidget] to provide
/// a convenient way to create sizeboxes with different spacing.
@sealed
abstract class Stem extends StatelessWidget {
  /// Constructor of [Stem]
  const Stem({super.key});

  ///
  factory Stem.none() => const _StemNone();

  /// Represents the smallest, most intimate spacing
  /// used for tight UI relationships.
  factory Stem.intimate({Axis axis = Axis.horizontal}) => _StemIntimate(axis);

  /// Represents personal spacing
  /// small gaps between related elements.
  factory Stem.personal({Axis axis = Axis.horizontal}) => _StemPersonal(axis);

  /// Represents social spacing
  /// gaps between social elements.
  factory Stem.social({Axis axis = Axis.horizontal}) => _StemSocial(axis);

  /// Represents public spacing
  /// large visual separation between groups.
  factory Stem.public({Axis axis = Axis.horizontal}) => _StemPublic(axis);

  /// Represents global spacing
  /// large gaps between unrelated elements.
  factory Stem.global({Axis axis = Axis.horizontal}) => _StemGlobal(axis);

  /// Creates a custom sizebox with the given space.
  factory Stem.custom(double space, {Axis axis = Axis.horizontal}) =>
      _StemCustom(space, axis);
}
