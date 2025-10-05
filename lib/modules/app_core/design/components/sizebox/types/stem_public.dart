part of '../stem.dart';

final class _StemPublic extends Stem {
  const _StemPublic(this.axis);

  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      Axis.vertical => Gap(context.h(context.spacing.public)),
      Axis.horizontal => Gap(context.w(context.spacing.public)),
    };
  }
}
