import 'dart:async' show Stream;
import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey, FieldRename;

import '../request/request.dart' show Request;
import '../metadata/metadata.dart' show Metadata;

part 'response.g.dart';

/// Advanced response object to store more information
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class Response {
  final Request request;
  final Map<String, String> headers;
  final Metadata metadata;
  @JsonKey(
    ignore: true,
  )
  final Stream<List<int>> data;

  Response(
    this.request, {
    this.headers = const <String, String>{},
    this.metadata = null,
    this.data = const Stream.empty(),
  });

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
