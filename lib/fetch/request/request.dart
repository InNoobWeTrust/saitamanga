import 'dart:async' show Stream;
import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey, FieldRename;

import '../metadata/metadata.dart' show Metadata;
import './query/query.dart' show Query;

part 'request.g.dart';

/// Advanced request object to store more information
@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class Request {
  final Uri rawLink;
  final Map<String, String> headers;
  final Query query;
  final Metadata metadata;
  @JsonKey(
    ignore: true,
  )
  final Stream<List<int>> data;

  /// Generate the query parameters for [rawLink] using [query] field
  Uri get link => rawLink == null
      ? rawLink
      : Uri(
          scheme: rawLink.scheme,
          userInfo: rawLink.userInfo,
          host: rawLink.host,
          port: rawLink.port,
          pathSegments: rawLink.pathSegments,
          queryParameters: query?.queryParams,
          fragment: rawLink.fragment);

  Request(
    this.rawLink, {
    this.headers = const <String, String>{},
    this.query = null,
    this.metadata = null,
    this.data = const Stream.empty(),
  });

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
