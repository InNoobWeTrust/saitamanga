import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;
import 'query_config.dart' show QueryConfig;

part 'info_config.g.dart';

@JsonSerializable(includeIfNull: false)
class InfoConfig {
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final String path;
  @JsonKey(nullable: true)
  final String preloadPath;
  @JsonKey(nullable: true)
  final List<QueryConfig> queryParams;

  InfoConfig(this.name, this.path, this.preloadPath, this.queryParams);

  factory InfoConfig.fromJson(Map<String, dynamic> json) =>
      _$InfoConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InfoConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
