import 'dart:async' show Stream;

import '../request/request.dart' show Request;

class Response {
  final Request request;
  final Map<String, String> headers;
  Stream<List<int>> data;
  final Map<String, dynamic> metadata;

  Response(this.request, this.data, {this.headers, this.metadata});
}
