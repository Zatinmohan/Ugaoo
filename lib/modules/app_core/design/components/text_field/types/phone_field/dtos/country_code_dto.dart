// ignore_for_file: public_member_api_docs, document_ignores

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code_dto.g.dart';

@JsonSerializable()
class CountryCodeDto {
  const CountryCodeDto({
    required this.countries,
  });
  factory CountryCodeDto.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeDtoFromJson(json);

  @JsonKey(name: 'countries')
  final List<CountryCodeDataDto> countries;

  Map<String, dynamic> toJson() => _$CountryCodeDtoToJson(this);
}

@JsonSerializable()
class CountryCodeDataDto {
  const CountryCodeDataDto({
    required this.countryCode,
    required this.dialCode,
    required this.name,
  });
  factory CountryCodeDataDto.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeDataDtoFromJson(json);

  @JsonKey(name: 'countryCode')
  final String countryCode;
  @JsonKey(name: 'dialCode')
  final String dialCode;
  @JsonKey(name: 'countryName')
  final String name;

  Map<String, dynamic> toJson() => _$CountryCodeDataDtoToJson(this);
}
