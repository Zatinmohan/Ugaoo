part of '../system_design_screen.dart';

class _ButtonVariation extends StatefulWidget {
  const _ButtonVariation();

  @override
  State<_ButtonVariation> createState() => _ButtonVariationState();
}

class _ButtonVariationState extends State<_ButtonVariation> {
  final Map<String, bool> _isLoading = {
    'primary': false,
    'secondary': false,
  };

  final Map<String, bool> _isDisabled = {
    'primary': false,
    'secondary': false,
  };

  void Function()? _onPressed(String key) {
    if (!_isLoading.containsKey(key) || _isDisabled[key]!) return null;
    return () {
      setState(() {
        _isLoading[key] = !_isLoading[key]!;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.spacing.public,
      children: [
        _Button(
          label: 'Primary Button',
          widget: Leaf.primary(
            label: 'Primary Button',
            onPressed: _onPressed('primary'),
            isLoading: _isLoading['primary']!,
          ),
          onCheckboxPress: (newValue) {
            setState(() {
              _isDisabled['primary'] = newValue ?? false;
            });
          },
          isButtonDisabled: _isDisabled['primary']!,
        ),
        _Button(
          label: 'Secondary Button',
          widget: Leaf.secondary(
            label: 'Secondary Button',
            onPressed: _onPressed('secondary'),
            isLoading: _isLoading['secondary']!,
          ),
          onCheckboxPress: (newValue) {
            setState(() {
              _isDisabled['secondary'] = newValue ?? false;
            });
          },
          isButtonDisabled: _isDisabled['secondary']!,
        ),
        _Button(
          label: 'Link Button',
          widget: Leaf.link(
            label: 'Link Button',
            onPressed: _onPressed('link'),
          ),
          onCheckboxPress: null,
          isButtonDisabled: false,
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.label,
    required this.widget,
    required this.onCheckboxPress,
    required this.isButtonDisabled,
  });

  final String label;
  final Leaf widget;
  final ValueChanged<bool?>? onCheckboxPress;
  final bool isButtonDisabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.personal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (onCheckboxPress == null)
              Bud.caption(text: label)
            else
              Bud.caption(
                  text:
                      '$label -  ${isButtonDisabled ? 'Disabled' : 'Enabled'}'),
            if (onCheckboxPress != null)
              Sprout(
                value: isButtonDisabled,
                onChanged: onCheckboxPress,
              ),
          ],
        ),
        widget,
      ],
    );
  }
}
