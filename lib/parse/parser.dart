import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import 'const/strategy.dart' show Strategy;
import 'const/role.dart' show Role;

part 'parser.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class Parser {
  @JsonKey(nullable: true)
  final Role role;
  @JsonKey(nullable: true)
  final String name;
  @JsonKey(nullable: true)
  final Strategy strategy;
  @JsonKey(nullable: false)
  final Map<String, String> instruction;

  Parser(this.role, this.name, this.strategy, this.instruction);

  factory Parser.fromJson(Map<String, dynamic> json) => _$ParserFromJson(json);

  Map<String, dynamic> toJson() => _$ParserToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
