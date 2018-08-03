import 'dart:async' show Stream;

import './option/option.dart' show Option;

class Request {
  final Uri link;
  Map<String, String> headers;
  Option option;
  Stream<List<int>> data;
  Map<String, dynamic> metadata;

  Request(this.link, {this.headers, this.option, this.data, this.metadata});
}
