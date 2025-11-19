part of '../../root.dart';

final class _PhoneField extends Root with RootMixin {
  const _PhoneField(super.config) : super._();

  @override
  Widget build(BuildContext context) {
    return buildTextField(context);
  }
}
