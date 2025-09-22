// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvironmentConfigDto _$EnvironmentConfigDtoFromJson(
        Map<String, dynamic> json) =>
    EnvironmentConfigDto(
      networkConfig: (json['networkConfig'] as List<dynamic>)
          .map((e) =>
              EnvironmentNetworkConfigDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnvironmentConfigDtoToJson(
        EnvironmentConfigDto instance) =>
    <String, dynamic>{
      'networkConfig': instance.networkConfig,
    };

EnvironmentNetworkConfigDto _$EnvironmentNetworkConfigDtoFromJson(
        Map<String, dynamic> json) =>
    EnvironmentNetworkConfigDto(
      key: json['key'] as String,
      baseUrl: json['base_url'] as String,
      sendTimeout: (json['send_timeout'] as num).toInt(),
      receiveTimeout: (json['receive_timeout'] as num).toInt(),
      connectTimeout: (json['connect_timeout'] as num).toInt(),
    );

Map<String, dynamic> _$EnvironmentNetworkConfigDtoToJson(
        EnvironmentNetworkConfigDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'base_url': instance.baseUrl,
      'send_timeout': instance.sendTimeout,
      'receive_timeout': instance.receiveTimeout,
      'connect_timeout': instance.connectTimeout,
    };
