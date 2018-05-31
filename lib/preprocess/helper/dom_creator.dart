import 'dart:async' show Future;

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' show Document;

class DomCreator {
  String encoding;
  String baseUri;

  DomCreator({this.encoding = 'utf-8', this.baseUri});

  DomCreator setEncoding(String encoding) => this..encoding = encoding;

  DomCreator setBaseUri(String baseUri) => this..baseUri = baseUri;

  Future<Document> generateDOM(String html) async {
    if (!(html is String) || html.isEmpty) return null;
    return parse(html, encoding: this.encoding, sourceUrl: this.baseUri);
  }
}
