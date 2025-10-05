part of '../stem.dart';

class _StemIntimate extends Stem {
  const _StemIntimate(this.axis);

  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      Axis.vertical => Gap(context.h(context.spacing.intimate)),
      Axis.horizontal => Gap(context.w(context.spacing.intimate)),
    };
  }
}
