import 'dart:async' show Future;
import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'parser.dart' show Parser;
import 'parse_product.dart' show ParseProduct;
import 'const/role.dart' show Role;
import 'strategy/parse_strategist.dart' show ParseStrategist;

part 'parse_element.g.dart';

@JsonSerializable(includeIfNull: false)
class ParseElement {
  @JsonKey(nullable: true)
  final String id;
  @JsonKey(nullable: true)
  final String name;
  @JsonKey(nullable: true)
  final String icon;
  @JsonKey(nullable: false)
  final List<Parser> parsers;

  ParseElement(this.id, this.name, this.icon, this.parsers);

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
    for (Parser parser in this.parsers) {
      switch (parser.role) {
        case Role.primary:
          primary = await parser.streamParse(data, parseStrategist).toList();
          break;
        case Role.link:
          link = await parser
              .streamParse(data, parseStrategist)
              .map((s) => Uri.tryParse(s))
              .toList();
          break;
        case Role.meta:
          meta[parser.name ?? "_"] =
              await parser.streamParse(data, parseStrategist).toList();
          break;
      }
    }
    return ParseProduct(this.id, this.name, this.icon, primary, link, meta);
  }

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(toJson());
  }
}
