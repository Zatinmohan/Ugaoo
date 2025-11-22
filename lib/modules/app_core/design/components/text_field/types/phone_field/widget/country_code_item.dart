part of '../../root.dart';

class _CountryCodeItemWidget extends StatelessWidget {
  const _CountryCodeItemWidget({
    required this.data,
    required this.onTap,
  });

  final CountryCodeModel data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          CountryFlag.fromCountryCode(
            data.countryCode,
            theme: ImageTheme(
              width: context.w(24),
              height: context.w(24),
              shape: const Circle(),
            ),
          ),
          Stem.h.social(),
          Expanded(child: Bud.label(text: data.name)),
          const Spacer(),
          Bud.label(text: data.dialCode),
        ],
      ),
    );
  }
}
