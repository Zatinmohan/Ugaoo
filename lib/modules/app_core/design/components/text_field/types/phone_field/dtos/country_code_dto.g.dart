// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCodeDto _$CountryCodeDtoFromJson(Map<String, dynamic> json) =>
    CountryCodeDto(
      countries: (json['countries'] as List<dynamic>)
          .map((e) => CountryCodeDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryCodeDtoToJson(CountryCodeDto instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };

CountryCodeDataDto _$CountryCodeDataDtoFromJson(Map<String, dynamic> json) =>
    CountryCodeDataDto(
      countryCode: json['countryCode'] as String,
      dialCode: json['dialCode'] as String,
      name: json['countryName'] as String,
    );

Map<String, dynamic> _$CountryCodeDataDtoToJson(CountryCodeDataDto instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'dialCode': instance.dialCode,
      'countryName': instance.name,
    };
