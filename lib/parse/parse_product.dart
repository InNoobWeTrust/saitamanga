import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

part 'parse_product.g.dart';

@JsonSerializable(includeIfNull: false)
class ParseProduct {
  @JsonKey(nullable: true)
  final String id;
  @JsonKey(nullable: true)
  final String name;
  @JsonKey(nullable: true)
  final String icon;
  final List<String> primary;
  final List<Uri> link;
  final Map<String, List<String>> meta;

  ParseProduct(
      this.id, this.name, this.icon, this.primary, this.link, this.meta);

  factory ParseProduct.fromJson(Map<String, dynamic> json) =>
      _$ParseProductFromJson(json);

  Map<String, dynamic> toJson() => _$ParseProductToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(toJson());
}
