part of '../stem.dart';

class _StemPersonal extends Stem {
  const _StemPersonal(this.axis);

  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      Axis.vertical => Gap(context.h(context.spacing.personal)),
      Axis.horizontal => Gap(context.w(context.spacing.personal)),
    };
  }
}
