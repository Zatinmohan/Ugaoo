part of '../stem.dart';

final class _StemSocial extends Stem {
  const _StemSocial(this.axis);

  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      Axis.vertical => Gap(context.h(context.spacing.social)),
      Axis.horizontal => Gap(context.w(context.spacing.social)),
    };
  }
}
