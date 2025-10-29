part of '../system_design_screen.dart';

class _InputVariation extends StatefulWidget {
  const _InputVariation();

  @override
  State<_InputVariation> createState() => _InputVariationState();
}

class _InputVariationState extends State<_InputVariation> {
  late final TextEditingController _otpController = TextEditingController();
  bool _isOtpFieldLoading = false;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Input(
              label: 'OTP Text Field',
              input: Root.otp(
                isLoading: _isOtpFieldLoading,
                controller: OtpRootFieldController(
                  controller: _otpController,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: context.padding.expanded),
                  child: Sprout(
                    value: _isOtpFieldLoading,
                    onChanged: (value) {
                      setState(() {
                        _isOtpFieldLoading = value ?? false;
                      });
                    },
                  ),
                ),
                Bud.caption(
                  text: _isOtpFieldLoading ? 'Loading' : 'Not Loading',
                ),
              ],
            )
          ],
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
