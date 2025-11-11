part of 'root.dart';

class _CountryCodeDropdown extends StatelessWidget {
  const _CountryCodeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.i(1.5),
          right: context.i(1),
          top: context.i(1),
          bottom: context.i(1.3),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.color.disabled.withValues(alpha: 0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                context.r(context.radius.large),
              ),
              bottomLeft: Radius.circular(
                context.r(context.radius.large),
              ),
            ),
          ),
          width: context.w(60),
          height: context.w(56),
          child: const Icon(Icons.phone),
        ),
      ),
    );
  }
}
