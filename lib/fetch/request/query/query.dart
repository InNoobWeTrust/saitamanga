import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename;

part 'query.g.dart';

/// Model for query part of [Request]
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class Query {
  final Map<String, String> inputs;
  final Map<String, String> radio;
  final Map<String, Iterable<String>> checkbox;

  Query(
    this.inputs,
    this.radio,
    this.checkbox,
  );

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

  Map<String, dynamic> toJson() => _$QueryToJson(this);

  Map<String, dynamic> get queryParams => <String, dynamic>{}
    ..addAll(this.inputs)
    ..addAll(this.radio)
    ..addAll(this.checkbox);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
