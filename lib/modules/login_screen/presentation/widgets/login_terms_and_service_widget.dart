part of '../login_screen.dart';

class _LoginTermsAndServiceWidget extends StatelessWidget {
  const _LoginTermsAndServiceWidget({
    required this.onTermsOfServiceTap,
    required this.onPrivacyPolicyTap,
  });

  final VoidCallback onTermsOfServiceTap;
  final VoidCallback onPrivacyPolicyTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Bud.caption(
            text: context.tr(
              LocaleKeys.terms_and_condition_message,
            ),
          ),
        ),
        Stem.h.personal(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bud.caption(
              text: context.tr(LocaleKeys.terms_of_service),
              decoration: TextDecoration.underline,
            ),
            const DotWidget(),
            Bud.caption(
              text: context.tr(LocaleKeys.privacy_policy),
              decoration: TextDecoration.underline,
            ),
          ],
        ),
      ],
    );
  }
}
