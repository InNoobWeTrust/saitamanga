import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;
import 'query_config.dart' show QueryConfig;

part 'info_config.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class InfoConfig {
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: true)
  final List<QueryConfig> queryParams;

  InfoConfig(this.name, this.queryParams);

  factory InfoConfig.fromJson(Map<String, dynamic> json) =>
      _$InfoConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InfoConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
