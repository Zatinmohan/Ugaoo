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

/// [Stem] is a class that extends [StatelessWidget] to provide
/// a convenient way to create sizeboxes with different spacing.
@sealed
abstract class Stem extends StatelessWidget {
  /// Constructor of [Stem]
  const Stem({super.key});

  /// Creates a horizontal space using the 'intimate' semantic token.
  /// This is the smallest horizontal gap.
  factory Stem.intimateH() => const _StemIntimate(Axis.horizontal);

  /// Creates a vertical space using the 'intimate' semantic token.
  /// This is the smallest vertical gap.
  factory Stem.intimateV() => const _StemIntimate(Axis.vertical);

  /// Creates a horizontal space using the 'personal' semantic token.
  /// Used for small horizontal gaps between related elements.
  factory Stem.personalH() => const _StemPersonal(Axis.horizontal);

  /// Creates a vertical space using the 'personal' semantic token.
  /// Used for small vertical gaps between related elements.
  factory Stem.personalV() => const _StemPersonal(Axis.vertical);

  /// Creates a horizontal space using the 'social' semantic token.
  /// Used for small horizontal gaps between social elements.
  factory Stem.socialH() => const _StemSocial(Axis.horizontal);

  /// Creates a vertical space using the 'social' semantic token.
  /// Used for small vertical gaps between social elements.
  factory Stem.socialV() => const _StemSocial(Axis.vertical);

  /// Creates a horizontal space using the 'public' semantic token.
  /// Used for small horizontal gaps between public elements.
  factory Stem.publicH() => const _StemPublic(Axis.horizontal);

  /// Creates a vertical space using the 'public' semantic token.
  /// Used for small vertical gaps between public elements.
  factory Stem.publicV() => const _StemPublic(Axis.vertical);

  /// Creates a horizontal space using the 'global' semantic token.
  /// Used for large horizontal gaps between unrelated elements.
  factory Stem.globalH() => const _StemGlobal(Axis.horizontal);

  /// Creates a vertical space using the 'global' semantic token.
  /// Used for large vertical gaps between unrelated elements.
  factory Stem.globalV() => const _StemGlobal(Axis.vertical);

  /// Creates a horizontal space using the 'custom' semantic token.
  /// Used for custom horizontal gaps between elements.
  factory Stem.customH(double space) => _StemCustom(space, Axis.horizontal);

  /// Creates a vertical space using the 'custom' semantic token.
  /// Used for custom vertical gaps between elements.
  factory Stem.customV(double space) => _StemCustom(space, Axis.vertical);

  /// Creates a none space using the 'none' semantic token.
  factory Stem.none() => const _StemNone();

  /// horizontal spacing context
  StemAxisBuilder get h => const StemAxisBuilder(Axis.horizontal);

  /// vertical spacing context
  StemAxisBuilder get v => const StemAxisBuilder(Axis.vertical);
}

/// A builder class to create a Stem widget with a specific axis.
final class StemAxisBuilder {
  /// Constructor of [StemAxisBuilder] that requires:
  /// - [axis] is the axis of the Stem widget
  const StemAxisBuilder(this.axis);

  /// Axis of the Stem widget
  final Axis axis;

  /// Creates a none space using the 'none' semantic token.
  Stem none() => const _StemNone();

  /// Creates a horizontal space using the 'intimate' semantic token.
  /// This is the smallest horizontal gap.
  Stem intimate() => _StemIntimate(axis);

  /// Creates a vertical space using the 'intimate' semantic token.
  Stem personal() => _StemPersonal(axis);

  /// Creates a horizontal space using the 'social' semantic token.
  Stem social() => _StemSocial(axis);

  /// Creates a vertical space using the 'social' semantic token.
  Stem public() => _StemPublic(axis);

  /// Creates a horizontal space using the 'public' semantic token.
  /// Used for small horizontal gaps between public elements.
  Stem global() => _StemGlobal(axis);

  /// Creates a vertical space using the 'global' semantic token.
  /// Used for large vertical gaps between unrelated elements.
  Stem custom(double space) => _StemCustom(space, axis);
}
