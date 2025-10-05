part of '../stem.dart';

final class _StemCustom extends Stem {
  const _StemCustom(this.space, this.axis);

  final double space;

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      Axis.vertical => Gap(context.h(space)),
      Axis.horizontal => Gap(context.w(space)),
    };
  }
}
