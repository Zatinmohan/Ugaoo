part of '../system_design_screen.dart';

class _TextVariations extends StatelessWidget {
  const _TextVariations();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.public,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bud.display(
          text: 'A display text: largest text in the system',
        ),
        Bud.headline(
          text: 'A headline text: second largest text in the system',
        ),
        Bud.title(
          text: 'A title text: third largest text in the system',
        ),
        Bud.bodyLarge(
          text: 'A body large text: fourth largest text in the system',
        ),
        Bud.bodyMedium(
          text: 'A body medium text: fifth largest text in the system',
        ),
        Bud.label(
          text: 'A label text: sixth largest text in the system',
        ),
        Bud.caption(
          text: 'A caption text: seventh largest text in the system',
        ),
      ],
    );
  }
}
