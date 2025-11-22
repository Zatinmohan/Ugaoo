part of '../../root.dart';

class _CountryCodeDropdown extends StatefulWidget {
  const _CountryCodeDropdown({required this.onSearchCallback});

  final void Function(String)? onSearchCallback;

  @override
  State<_CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<_CountryCodeDropdown> {
  late final ValueNotifier<List<CountryCodeModel>> _countryCodeNotifier =
      ValueNotifier([]);
  List<CountryCodeModel> _allCountryCodes = [];
  late final ValueNotifier<CountryCodeModel?> _selectedCountryCode =
      ValueNotifier<CountryCodeModel?>(null);
  late final DefaultRootFieldController _searchController;

  @override
  void initState() {
    super.initState();
    _getCountryCodeData();
    _searchController = DefaultRootFieldController(
      controller: TextEditingController(),
    );
    _searchController.controller.addListener(_searchBarListener);
  }

  @override
  void dispose() {
    _selectedCountryCode.dispose();
    _searchController.controller.removeListener(_searchBarListener);
    _searchController.controller.dispose();
    super.dispose();
  }

  void _searchBarListener() {
    final enteredText = _searchController.controller.text;

    if (enteredText.isEmpty) {
      _countryCodeNotifier.value = List.from(_allCountryCodes);
    } else {
      _countryCodeNotifier.value = _allCountryCodes.where((data) {
        if (enteredText.isString()) {
          return data.name.toLowerCase().contains(enteredText.toLowerCase());
        }

        return data.dialCode.contains(enteredText);
      }).toList();
    }
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
        _allCountryCodes = result.toModel();
        _countryCodeNotifier.value = List.from(_allCountryCodes);
        _selectInitialCountryCode();
      },
    );
  }

  void _selectInitialCountryCode() {
    _selectedCountryCode.value = _countryCodeNotifier.value.firstWhere(
      (code) => code.countryCode == 'IN',
      orElse: () => _countryCodeNotifier.value.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showSheet<void>(context,
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
                    controller: _searchController,
                    maxLines: 1,
                  ),
                  Stem.h.social(),
                  ValueListenableBuilder<List<CountryCodeModel>>(
                      valueListenable: _countryCodeNotifier,
                      builder: (context, value, _) {
                        return Flexible(
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                final data = value[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: context.i(context.spacing.social),
                                  ),
                                  child: _CountryCodeItemWidget(
                                    data: data,
                                    onTap: () {
                                      if (_selectedCountryCode
                                              .value?.countryCode !=
                                          data.countryCode) {
                                        _selectedCountryCode.value = data;
                                      }
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              }),
                        );
                      }),
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
        child: _PickedCountryCodeSuffixWidget(data: _selectedCountryCode),
      ),
    );
  }
}
