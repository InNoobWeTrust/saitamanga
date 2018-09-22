import 'dart:async' show Future;
import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'parser.dart' show Parser;
import 'parse_product.dart' show ParseProduct;
import 'const/role.dart' show Role;

part 'parse_element.g.dart';

@JsonSerializable(includeIfNull: false)
class ParseElement {
  @JsonKey(nullable: true)
  String id;
  @JsonKey(nullable: true)
  String name;
  @JsonKey(nullable: true)
  String icon;
  @JsonKey(nullable: false)
  List<Parser> parsers;

  ParseElement({this.id, this.name, this.icon, this.parsers});

  factory ParseElement.fromJson(Map<String, dynamic> json) =>
      _$ParseElementFromJson(json);

  Map<String, dynamic> toJson() => _$ParseElementToJson(this);

  /// The type of [data] varies in different sources.
  /// Refer to [Parser.streamParse()] for more information
  Future<ParseProduct> parse(dynamic data) async {
    ParseProduct product =
        ParseProduct(id: this.id, name: this.name, icon: this.icon);
    for (Parser parser in this.parsers) {
      switch (parser.role) {
        case Role.primary:
          product.primary = await parser.streamParse(data).toList();
          break;
        case Role.link:
          product.link = await parser
              .streamParse(data)
              .map((s) => Uri.tryParse(s))
              .toList();
          break;
        case Role.meta:
          product.meta = await parser.streamParse(data).toList();
          break;
      }
    }
    return product;
  }

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(toJson());
  }
}
