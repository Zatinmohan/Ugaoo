part of '../stem.dart';

class _StemGlobal extends Stem {
  const _StemGlobal(this.axis);

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      Axis.vertical => Gap(context.h(context.spacing.global)),
      Axis.horizontal => Gap(context.w(context.spacing.global)),
    };
  }
}
