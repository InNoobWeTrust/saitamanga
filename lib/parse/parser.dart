import 'dart:async' show Stream;
import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'strategy/parser_strategy_generator.dart' show ParserStrategyGenerator;
import 'const/amount.dart' show Amount;
import 'const/strategy.dart' show Strategy;
import 'const/role.dart' show Role;

part 'parser.g.dart';

@JsonSerializable(includeIfNull: false)
class Parser {
  @JsonKey(nullable: true)
  final Role role;
  @JsonKey(nullable: false)
  final Amount amount;
  @JsonKey(nullable: false)
  final Strategy strategy;
  @JsonKey(nullable: false)
  final Map<String, String> instructions;

  Parser(this.role, this.amount, this.strategy, this.instructions);

  factory Parser.fromJson(Map<String, dynamic> json) => _$ParserFromJson(json);

  Map<String, dynamic> toJson() => _$ParserToJson(this);

  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources'
  ///   - [String]        for other sources
  Stream<String> streamParse(
      dynamic data, ParserStrategyGenerator parserStrategyGenerator) {
    return parserStrategyGenerator.generateStrategy(this)?.streamParse(data);
  }

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
