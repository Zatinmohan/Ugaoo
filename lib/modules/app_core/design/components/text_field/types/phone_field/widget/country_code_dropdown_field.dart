part of '../../root.dart';

class _CountryCodeDropdown extends StatefulWidget {
  const _CountryCodeDropdown({super.key});

  @override
  State<_CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<_CountryCodeDropdown> {
  late final List<CountryCodeModel> _countryCodes = [];

  @override
  void initState() {
    super.initState();
    _getCountryCodeData();
  }

  Future<void> _getCountryCodeData() async {
    final result = await JsonUtility()
        .loadJsonFromAsset(path: Assets.data.json.countryCode)
        .run();

    result.match(
      (failure) {
        log.e(
          'Failed to load country code data',
          config: LoggerModel(
            exception: failure,
            name: 'Country Code Dropdown',
          ),
        );
      },
      (data) {
        final result = CountryCodeDto.fromJson(data);
        _countryCodes.addAll(result.toModel());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showSheet<void>(context,
            isScrollControlled: true,
            body: Padding(
              padding: EdgeInsets.all(context.i(context.padding.compact)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Bud.title(text: 'Select country code'),
                  Stem.h.social(),
                  Flexible(
                    child: ListView.builder(
                        itemCount: _countryCodes.length,
                        itemBuilder: (context, index) {
                          final data = _countryCodes[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: context.i(context.spacing.social),
                            ),
                            child: Row(
                              children: [
                                Bud.label(text: data.name),
                                const Spacer(),
                                Bud.label(text: data.dialCode),
                              ],
                            ),
                          );
                        }),
                  ),
                  Stem.h.personal(),
                  Leaf.primary(label: 'label', onPressed: () {}),
                ],
              ),
            ));
      },
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
                context.r(context.radius.large - 1),
              ),
              bottomLeft: Radius.circular(
                context.r(context.radius.large - 1),
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
