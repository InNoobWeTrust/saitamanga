import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import './parse_element_config.dart' show ParseElementConfig;
import './const/input_type.dart' show InputType;

part 'query_config.g.dart';

/// Instruct how to do the query for raw data
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class QueryConfig {
  @JsonKey(
    nullable: false,
  )
  final String name;
  @JsonKey(
    nullable: false,
  )
  final String displayName;
  @JsonKey(
    nullable: false,
  )
  final InputType input;
  final ParseElementConfig preload;
  final List<String> options;
  @JsonKey(
    nullable: true,
    name: "default",
  )
  final List<String> defaultValue;

  QueryConfig(
    this.name,
    this.displayName,
    this.input,
    this.preload,
    this.options,
    this.defaultValue,
  );

  factory QueryConfig.fromJson(Map<String, dynamic> json) =>
      _$QueryConfigFromJson(json);

  Map<String, dynamic> toJson() => _$QueryConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
