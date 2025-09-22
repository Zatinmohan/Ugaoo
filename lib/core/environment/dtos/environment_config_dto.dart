// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_config_dto.g.dart';

@JsonSerializable()
class EnvironmentConfigDto {
  const EnvironmentConfigDto({
    required this.networkConfig,
  });

  factory EnvironmentConfigDto.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentConfigDtoFromJson(json);

  final List<EnvironmentNetworkConfigDto> networkConfig;

  Map<String, dynamic> toJson() => _$EnvironmentConfigDtoToJson(this);
}

@JsonSerializable()
class EnvironmentNetworkConfigDto {
  const EnvironmentNetworkConfigDto({
    required this.key,
    required this.baseUrl,
    required this.sendTimeout,
    required this.receiveTimeout,
    required this.connectTimeout,
  });
  factory EnvironmentNetworkConfigDto.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentNetworkConfigDtoFromJson(json);

  @JsonKey(name: 'key')
  final String key;
  @JsonKey(name: 'base_url')
  final String baseUrl;
  @JsonKey(name: 'send_timeout')
  final int sendTimeout;
  @JsonKey(name: 'receive_timeout')
  final int receiveTimeout;
  @JsonKey(name: 'connect_timeout')
  final int connectTimeout;

  Map<String, dynamic> toJson() => _$EnvironmentNetworkConfigDtoToJson(this);
}
