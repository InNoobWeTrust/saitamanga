import '../request/request.dart' show Request;

class Response {
  final Request request;
  final Map<String, String> headers;
  final Map<String, dynamic> data;
  final Map<String, dynamic> metadata;

  Response(this.request, this.data, {this.headers, this.metadata});
}
