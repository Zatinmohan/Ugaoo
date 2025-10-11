part of '../system_design_screen.dart';

class _ColorVariations extends StatelessWidget {
  const _ColorVariations();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: context.spacing.public,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ColorWithName(text: 'Primary', color: context.color.primary),
          _ColorWithName(text: 'Secondary', color: context.color.secondary),
          _ColorWithName(text: 'Accent', color: context.color.accent),
          _ColorWithName(text: 'Background', color: context.color.background),
          _ColorWithName(text: 'Surface', color: context.color.surface),
          _ColorWithName(
              text: 'Text Primary', color: context.color.textPrimary),
          _ColorWithName(
              text: 'Text Secondary', color: context.color.textSecondary),
          _ColorWithName(text: 'Success', color: context.color.success),
          _ColorWithName(text: 'Warning', color: context.color.warning),
          _ColorWithName(text: 'Error', color: context.color.error),
          _ColorWithName(text: 'Info', color: context.color.info),
          _ColorWithName(text: 'Disabled', color: context.color.disabled),
        ],
      ),
    );
  }
}

class _ColorWithName extends StatelessWidget {
  const _ColorWithName({
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bud.label(text: text),
        Container(
          height: context.screenWidth * 0.2,
          width: context.screenWidth,
          color: color,
        ),
      ],
    );
  }
}
