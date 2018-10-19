import 'dart:async' show Stream;
import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import 'strategy/parse_strategist.dart' show ParseStrategist;
import 'const/amount.dart' show Amount;
import 'const/strategy.dart' show Strategy;
import 'const/role.dart' show Role;

part 'parser.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class Parser {
  @JsonKey(nullable: true)
  final Role role;
  @JsonKey(nullable: true)
  final String name;
  @JsonKey(nullable: false)
  final Amount amount;
  @JsonKey(nullable: true)
  final Strategy strategy;
  @JsonKey(nullable: false)
  final Map<String, String> instruction;

  Parser(this.role, this.name, this.amount, this.strategy, this.instruction);

  factory Parser.fromJson(Map<String, dynamic> json) => _$ParserFromJson(json);

  Map<String, dynamic> toJson() => _$ParserToJson(this);

  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources'
  ///   - [String]        for other sources
  Stream<String> streamParse(dynamic data, ParseStrategist strategist) {
    return strategist.provideStrategy(this)?.streamParse(data);
  }

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
