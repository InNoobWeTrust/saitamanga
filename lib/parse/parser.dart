import 'dart:async' show Stream;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'strategy/parser_strategy.dart' show ParserStrategy;
import 'const/amount.dart' show Amount;
import 'const/strategy.dart' show Strategy;
import 'const/role.dart' show Role;

part 'parser.g.dart';

@JsonSerializable()
class Parser {
  @JsonKey(nullable: true)
  Role role;
  @JsonKey(nullable: false)
  Amount amount;
  @JsonKey(nullable: false)
  Strategy strategy;
  @JsonKey(nullable: false)
  Map<String, String> instructions;
  ParserStrategy _parserStrategy;

  Parser({this.role, this.amount, this.strategy, this.instructions});

  factory Parser.fromJson(Map<String, dynamic> json) => _$ParserFromJson(json);

  Map<String, dynamic> toJson() => _$ParserToJson(this);

  void injectParserStrategy(ParserStrategy parserStrategy) =>
      this._parserStrategy = parserStrategy;

  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources'
  ///   - [String]        for other sources
  Stream<String> streamParse(dynamic data) => _parserStrategy.streamParse(data);

  @override
  String toString() {
    return """{
      amount: ${this.amount},
      strategy: ${this.strategy},
      instructions: ${this.instructions}
      }""";
  }
}
