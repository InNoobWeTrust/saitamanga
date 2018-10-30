import 'dart:async' show Future;
import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import 'parser.dart' show Parser;
import 'parse_product.dart' show ParseProduct;
import 'const/role.dart' show Role;
import 'const/id.dart' show Id;
import 'const/amount.dart' show Amount;
import 'const/sort.dart' show Sort;
import 'strategy/parse_strategist.dart' show ParseStrategist;

part 'parse_element.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ParseElement {
  @JsonKey(nullable: true)
  final Id id;
  @JsonKey(nullable: true)
  final String name;
  @JsonKey(nullable: true)
  final String target;
  @JsonKey(nullable: false)
  final Amount amount;
  @JsonKey(nullable: true)
  final Sort sort;
  @JsonKey(nullable: true)
  final String icon;
  @JsonKey(nullable: false)
  final List<Parser> parsers;

  ParseElement(
      this.id, this.name, this.target, this.amount, this.icon, this.parsers,
      {this.sort = Sort.asc});

  factory ParseElement.fromJson(Map<String, dynamic> json) =>
      _$ParseElementFromJson(json);

  Map<String, dynamic> toJson() => _$ParseElementToJson(this);

  /// The type of [data] varies in different sources.
  /// Refer to [Parser.streamParse()] for more information
  Future<ParseProduct> parse(
      dynamic data, ParseStrategist parseStrategist) async {
    List<String> primary;
    List<Uri> link;
    Map<String, List<String>> meta;
    var getStrategyDoParse = (Parser parser, Amount amount, dynamic data) =>
        parseStrategist.provideStrategy(parser, amount).streamParse(data);
    for (Parser parser in this.parsers) {
      switch (parser.role) {
        case Role.primary:
          primary =
              await getStrategyDoParse(parser, this.amount, data).toList();
          break;
        case Role.link:
          link = await getStrategyDoParse(parser, this.amount, data)
              .map((s) => Uri.tryParse(s))
              .toList();
          break;
        case Role.meta:
          meta[parser.name ?? "_"] =
              await getStrategyDoParse(parser, this.amount, data).toList();
          break;
      }
    }
    return ParseProduct(
        this.id, this.name, this.target, this.icon, primary, link, meta);
  }

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(toJson());
  }
}
