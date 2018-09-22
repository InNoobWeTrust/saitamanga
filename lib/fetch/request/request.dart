import 'dart:async' show Stream;

import './option/option.dart' show Option;

class Request {
  final Uri rawLink;

  /// Generate the query parameters for [rawLink] using [option] field
  /// to get this
  Uri get link => rawLink == null
      ? rawLink
      : Uri(
          scheme: rawLink.scheme,
          userInfo: rawLink.userInfo,
          host: rawLink.host,
          port: rawLink.port,
          pathSegments: rawLink.pathSegments,
          queryParameters: option?.queryParams,
          fragment: rawLink.fragment);
  Map<String, String> headers = <String, String>{};
  Option option;
  Stream<List<int>> data;
  Map<String, dynamic> metadata = <String, dynamic>{};

  Request(this.rawLink, {this.headers, this.option, this.data, this.metadata});

  Request setHeaders(Map<String, String> headers) => this..headers = headers;

  Request addHeaders(Map<String, String> headers) => this
    ..headers ??= <String, String>{}
    ..headers.addAll(headers);

  Request addHeaderEntry(MapEntry<String, String> headerEntry) => this
    ..headers ??= <String, String>{}
    ..headers.addEntries([headerEntry]);

  Request addHeader(String name, String value) =>
      this..addHeaderEntry(MapEntry(name, value));

  Request setMetadata(Map<String, dynamic> metadata) =>
      this..metadata = metadata;

  Request addAllMetadata(Map<String, dynamic> metadata) => this
    ..metadata ??= <String, dynamic>{}
    ..metadata.addAll(metadata);

  Request addMetadataEntry(MapEntry<String, dynamic> metadataEntry) => this
    ..metadata ??= <String, dynamic>{}
    ..metadata.addEntries([metadataEntry]);

  Request addMetadata(String name, dynamic value) =>
      this..addMetadataEntry(MapEntry<String, dynamic>(name, value));
}
