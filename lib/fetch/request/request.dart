import 'dart:async' show Stream;

import './option/option.dart' show Option;

class Request {
  final Uri link;
  Map<String, String> headers;
  Option option;
  Stream<List<int>> data;
  Map<String, dynamic> metadata;

  Request(this.link, {this.headers, this.option, this.data, this.metadata});

  Request setHeaders(Map<String, String> headers) => this..headers = headers;

  Request addHeaders(Map<String, String> headers) => this
    ..headers ??= <String, String>{}
    ..headers.addAll(headers);

  Request addHeaderEntry(MapEntry<String, String> headerEntry) => this
    ..headers ??= <String, String>{}
    ..headers.addEntries([headerEntry]);

  Request addHeader(String name, String value) =>
      this..addHeaderEntry(new MapEntry(name, value));

  Request setMetadata(Map<String, dynamic> metadata) =>
      this..metadata = metadata;

  Request addAllMetadata(Map<String, dynamic> metadata) => this
    ..metadata ??= <String, dynamic>{}
    ..metadata.addAll(metadata);

  Request addMetadataEntry(MapEntry<String, dynamic> metadataEntry) => this
    ..metadata ??= <String, dynamic>{}
    ..metadata.addEntries([metadataEntry]);

  Request addMetadata(String name, dynamic value) =>
      this..addMetadataEntry(new MapEntry<String, dynamic>(name, value));
}
