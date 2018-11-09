import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

part 'info_config.g.dart';

/// The information of current [View]
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class InfoConfig {
  @JsonKey(
    nullable: false,
  )
  final String name;

  InfoConfig(this.name);

  factory InfoConfig.fromJson(Map<String, dynamic> json) =>
      _$InfoConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InfoConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
