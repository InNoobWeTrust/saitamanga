import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename;

import '../const/method.dart' show Method;

part 'metadata.g.dart';

/// Model for metadata part of [Request]
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class Metadata {
  final Method method;

  Metadata(this.method);

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
