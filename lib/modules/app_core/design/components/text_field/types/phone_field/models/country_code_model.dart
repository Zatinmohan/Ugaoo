/// Model representing a country code for phone fields.
class CountryCodeModel {
  /// Creates a [CountryCodeModel] that requires:
  /// - [name] is the name of the country.
  /// - [countryCode] is the ISO country code.
  /// - [dialCode] is the dial code for the country.
  const CountryCodeModel({
    required this.name,
    required this.countryCode,
    required this.dialCode,
  });

  /// The name of the country.
  final String name;

  /// The ISO country code.
  final String countryCode;

  /// The dial code for the country.
  final String dialCode;
}
