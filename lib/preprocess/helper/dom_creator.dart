import 'dart:async' show Future;

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' show Document;

class DomCreator {
  final String encoding;
  final String baseUri;

  DomCreator(this.baseUri, {this.encoding = 'utf-8'});

  Future<Document> generateDOM(String html) async {
    if (!(html is String) || html.isEmpty) return null;
    return parse(html, encoding: this.encoding, sourceUrl: this.baseUri);
  }
}
