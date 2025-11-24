part of '../login_screen.dart';

class _LoginInfoWidget extends StatelessWidget {
  const _LoginInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bud.display(text: context.tr(LocaleKeys.welcome)),
        Stem.h.personal(),
        Bud.label(
          text: context.tr(
            LocaleKeys.enter_your_phone_number,
          ),
        ),
        Stem.h.intimate(),
        Bud.label(
          text: context.tr(LocaleKeys.verify_send_otp_message),
        ),
      ],
    );
  }
}
