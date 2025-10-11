part of '../system_design_screen.dart';

class _SwitcherVariations extends StatefulWidget {
  const _SwitcherVariations();

  @override
  State<_SwitcherVariations> createState() => _SwitcherVariationsState();
}

class _SwitcherVariationsState extends State<_SwitcherVariations> {
  final Map<String, bool> _isToggled = {
    'small': false,
    'medium': false,
    'large': false,
  };

  final Map<String, bool> _isDisabled = {
    'small': false,
    'medium': false,
    'large': false,
  };

  ValueChanged<bool>? _onToggleChange(String key) {
    if (_isDisabled[key] ?? false) return null;
    return (newValue) {
      setState(() {
        _isToggled[key] = newValue;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing.public,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Switcher(
          checkBoxTicked: _isDisabled['small']!,
          label: 'Small Sprout',
          widget: Tendril.small(
            value: _isToggled['small']!,
            onChanged: _onToggleChange('small'),
          ),
          onCheckboxChange: (newValue) {
            setState(() {
              _isDisabled['small'] = newValue ?? false;
            });
          },
        ),
        _Switcher(
          checkBoxTicked: _isDisabled['medium']!,
          label: 'Medium Sprout',
          widget: Tendril.medium(
            value: _isToggled['medium']!,
            onChanged: _onToggleChange('medium'),
          ),
          onCheckboxChange: (newValue) {
            setState(() {
              _isDisabled['medium'] = newValue ?? false;
            });
          },
        ),
        _Switcher(
          checkBoxTicked: _isDisabled['large']!,
          label: 'Large Sprout',
          widget: Tendril.large(
            value: _isToggled['large']!,
            onChanged: _onToggleChange('large'),
          ),
          onCheckboxChange: (newValue) {
            setState(() {
              _isDisabled['large'] = newValue ?? false;
            });
          },
        ),
      ],
    );
  }
}

class _Switcher extends StatelessWidget {
  const _Switcher({
    required this.label,
    required this.widget,
    required this.onCheckboxChange,
    required this.checkBoxTicked,
  });

  final String label;
  final Widget widget;
  final ValueChanged<bool?>? onCheckboxChange;
  final bool checkBoxTicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.spacing.personal,
      children: [
        Bud.caption(text: label),
        Row(
          children: [
            widget,
            const Spacer(),
            Stem.h.public(),
            Column(
              children: [
                Bud.caption(text: !checkBoxTicked ? 'Enabled' : 'Disabled'),
                Sprout(
                  value: checkBoxTicked,
                  onChanged: onCheckboxChange,
                ),
                Stem.h.social(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
