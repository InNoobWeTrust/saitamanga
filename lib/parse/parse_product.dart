import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename;

import '../config/const/id.dart' show Id;

part 'parse_product.g.dart';

/// Represent distinct interested data
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class ParseProduct {
  final Id id;
  final String name;
  final String target;
  final String icon;
  final List<String> primary;
  final List<Uri> link;
  final Map<String, List<String>> metadata;

  ParseProduct(
    this.id,
    this.name,
    this.target,
    this.icon,
    this.primary,
    this.link,
    this.metadata,
  );

  factory ParseProduct.fromJson(Map<String, dynamic> json) =>
      _$ParseProductFromJson(json);

  Map<String, dynamic> toJson() => _$ParseProductToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(toJson());
}
