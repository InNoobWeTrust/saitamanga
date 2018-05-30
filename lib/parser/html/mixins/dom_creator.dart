import 'dart:async' show Future;

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' show Document;

abstract class DomCreator {
  String encoding;
  String baseUri;

  Future<Document> generateDOM(String html) async {
    if (!(html is String) || html.isEmpty) return null;
    return parse(html, encoding: this.encoding, sourceUrl: this.baseUri);
  }
}
