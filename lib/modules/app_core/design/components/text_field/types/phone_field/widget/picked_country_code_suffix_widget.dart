part of '../../root.dart';

class _PickedCountryCodeSuffixWidget extends StatelessWidget {
  const _PickedCountryCodeSuffixWidget({
    required this.data,
  });

  final ValueNotifier<CountryCodeModel?> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.color.disabled.withValues(alpha: 0.3).withAlpha(150),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            context.r(context.radius.large - 1),
          ),
          bottomLeft: Radius.circular(
            context.r(context.radius.large - 1),
          ),
        ),
      ),
      width: context.w(80),
      height: context.w(56),
      padding: EdgeInsets.symmetric(
        horizontal: context.i(context.padding.compact),
      ),
      child: ValueListenableBuilder<CountryCodeModel?>(
          valueListenable: data,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryFlag.fromCountryCode(
                  value?.countryCode ?? 'IN',
                  theme: ImageTheme(
                    width: context.w(16),
                    height: context.w(16),
                    shape: const Circle(),
                  ),
                ),
                Stem.h.personal(),
                Flexible(
                  child: FittedBox(
                    child: Bud.label(
                      text: value?.dialCode ?? '+91',
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
