import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;
import '../parse/parse_element.dart' show ParseElement;

part 'query_config.g.dart';

@JsonSerializable(includeIfNull: false)
class QueryConfig {
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final String displayName;
  @JsonKey(nullable: false)
  final InputType input;
  @JsonKey(nullable: true)
  final ParseElement preload;
  @JsonKey(nullable: true)
  final List<String> options;
  @JsonKey(name: "default", nullable: true)
  final List<String> defaultValue;

  QueryConfig(this.name, this.displayName, this.input, this.preload,
      this.options, this.defaultValue);

  factory QueryConfig.fromJson(Map<String, dynamic> json) =>
      _$QueryConfigFromJson(json);

  Map<String, dynamic> toJson() => _$QueryConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}

enum InputType { text, number, radio, checkbox }
