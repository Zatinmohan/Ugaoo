part of 'root.dart';

final class _DefaultRoot extends Root with RootMixin {
  const _DefaultRoot(super.config) : super._();

  @override
  Widget build(BuildContext context) {
    return buildTextField(context);
  }
}
