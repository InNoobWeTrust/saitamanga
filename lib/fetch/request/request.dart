import './option/option.dart' show Option;

class Request {
  final Uri link;
  Map<String, String> headers;
  Option option;
  Map<String, dynamic> metadata;

  Request(this.link, {this.headers, this.option, this.metadata});
}
