part of '../system_design_screen.dart';

class _InputVariation extends StatelessWidget {
  const _InputVariation();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.public,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Input(
          label: 'Default Text Field',
          input: Root(
            controller: DefaultRootFieldController(
              controller: TextEditingController(),
            ),
            hintText: 'Hint Text',
          ),
        ),
        _Input(
          label: 'OTP Text Field',
          input: Root.otp(
            controller: OtpRootFieldController(
              controller: TextEditingController(),
            ),
          ),
        ),
      ],
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({required this.label, required this.input});

  final String label;
  final Root input;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.social,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bud.label(text: label),
        input,
      ],
    );
  }
}
