part of '../../root.dart';

class _CountryCodeDropdown extends StatefulWidget {
  const _CountryCodeDropdown({super.key});

  @override
  State<_CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<_CountryCodeDropdown> {
  late final List<CountryCodeModel> _countryCodes = [];
  late final ValueNotifier<CountryCodeModel?> _selectedCountryCode =
      ValueNotifier<CountryCodeModel?>(null);

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
        _selectInitialCountryCode();
      },
    );
  }

  void _selectInitialCountryCode() {
    _selectedCountryCode.value = _countryCodes.firstWhere(
      (code) => code.countryCode == 'IN',
      orElse: () => _countryCodes.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showSheet<void>(context,
            isScrollControlled: true,
            body: Padding(
              padding: EdgeInsets.all(context.i(context.padding.regular)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Bud.title(text: 'Select country code'),
                  Stem.h.social(),
                  Root(
                    hintText: 'Search country code',
                  ),
                  Stem.h.public(),
                  Flexible(
                    child: ListView.builder(
                        itemCount: _countryCodes.length,
                        itemBuilder: (context, index) {
                          final data = _countryCodes[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: context.i(context.spacing.social),
                            ),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                if (_selectedCountryCode.value?.countryCode !=
                                    data.countryCode) {
                                  _selectedCountryCode.value = data;
                                }
                                Navigator.pop(context);
                              },
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
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ));
      },
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.i(1.5),
          right: context.i(1.2),
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
          width: context.w(80),
          height: context.w(56),
          padding: EdgeInsets.symmetric(
            horizontal: context.i(context.padding.compact),
          ),
          child: ValueListenableBuilder<CountryCodeModel?>(
              valueListenable: _selectedCountryCode,
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
                        child: Bud.title(
                          text: value?.dialCode ?? '+91',
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
