import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import '../preprocess/const/preprocess_type.dart' show PreprocessType;
import './parser_config.dart' show ParserConfig;
import './const/id.dart' show Id;
import './const/amount.dart' show Amount;
import './const/sort.dart' show Sort;

part 'parse_element_config.g.dart';

/// The single element to represent distinct interested data
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ParseElementConfig {
  @JsonKey(nullable: true)
  final Id id;
  @JsonKey(nullable: true)
  final String name;
  @JsonKey(nullable: true)
  final String target;
  @JsonKey(nullable: true)
  final PreprocessType preprocessType;
  @JsonKey(nullable: false)
  final Amount amount;
  @JsonKey(nullable: true)
  final Sort sort;
  @JsonKey(nullable: true)
  final String icon;
  @JsonKey(nullable: false, name: 'parsers')
  final List<ParserConfig> parserConfigs;

  ParseElementConfig(this.id, this.name, this.target, this.preprocessType,
      this.amount, this.icon, this.parserConfigs,
      {this.sort = Sort.asc});

  factory ParseElementConfig.fromJson(Map<String, dynamic> json) =>
      _$ParseElementConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ParseElementConfigToJson(this);

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(toJson());
  }
}
