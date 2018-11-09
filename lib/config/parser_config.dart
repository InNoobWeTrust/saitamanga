import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import './const/strategy.dart' show Strategy;
import './const/role.dart' show Role;

part 'parser_config.g.dart';

/// Intruct how to parse raw data
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class ParserConfig {
  final Role role;
  final String name;
  final Strategy strategy;
  @JsonKey(
    nullable: false,
  )
  final Map<String, String> instruction;

  ParserConfig(
    this.role,
    this.name,
    this.strategy,
    this.instruction,
  );

  factory ParserConfig.fromJson(Map<String, dynamic> json) =>
      _$ParserConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ParserConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
