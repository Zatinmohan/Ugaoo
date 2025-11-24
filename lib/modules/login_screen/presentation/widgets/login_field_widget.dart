part of '../login_screen.dart';

class _LoginFieldWidget extends StatelessWidget {
  const _LoginFieldWidget({
    required this.phoneController,
  });

  final PhoneFieldController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Root.phone(
          semanticLabel: 'Phone Field',
          controller: phoneController,
        ),
        Stem.h.social(),
        Leaf.primary(
          semanticLabel: 'Continue Button',
          label: context.tr(LocaleKeys.continue_text),
          onPressed: () {
            if (phoneController.textController.text.isEmpty) {
              phoneController.animationController!.reset();
              phoneController.animationController!.forward();
            }
          },
        ),
      ],
    );
  }
}
