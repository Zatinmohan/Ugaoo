import 'package:ugaoo/modules/app_core/design/components/text_field/types/phone_field/dtos/country_code_dto.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/types/phone_field/models/country_code_model.dart';

/// Extension to convert [CountryCodeDto] to [CountryCodeModel]
extension XCountryCodeExtension on CountryCodeDto {
  /// Converts [CountryCodeDto] to [CountryCodeModel]
  List<CountryCodeModel> toModel() {
    return countries
        .map(
          (data) => CountryCodeModel(
            name: data.name,
            countryCode: data.countryCode,
            dialCode: data.dialCode,
          ),
        )
        .toList();
  }
}
