import 'dart:async' show Stream;

import '../request/request.dart' show Request;

class Response {
  final Request request;
  Map<String, String> headers;
  Stream<List<int>> data;
  Map<String, dynamic> metadata;

  Response(this.request, this.data, {this.headers, this.metadata});

  Response setHeaders(Map<String, String> headers) => this..headers = headers;

  Response addHeaders(Map<String, String> headers) => this
    ..headers ??= <String, String>{}
    ..headers.addAll(headers);

  Response addHeaderEntry(MapEntry<String, String> headerEntry) => this
    ..headers ??= <String, String>{}
    ..headers.addEntries([headerEntry]);

  Response addHeader(String name, String value) =>
      this..addHeaderEntry(new MapEntry(name, value));

  Response setMetadata(Map<String, dynamic> metadata) =>
      this..metadata = metadata;

  Response addAllMetadata(Map<String, dynamic> metadata) => this
    ..metadata ??= <String, dynamic>{}
    ..metadata.addAll(metadata);

  Response addMetadataEntry(MapEntry<String, dynamic> metadataEntry) => this
    ..metadata ??= <String, dynamic>{}
    ..metadata.addEntries([metadataEntry]);

  Response addMetadata(String name, dynamic value) =>
      this..addMetadataEntry(new MapEntry<String, dynamic>(name, value));
}
