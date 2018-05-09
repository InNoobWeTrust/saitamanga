import 'dart:async';

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' show Document;

import 'parser.dart' show Parser;

class SelectParser implements Parser {
  String extractor;

  SelectParser(String selector) {
    assert(selector is String);
    if (selector.isEmpty) throw ArgumentError('selector must not be an empty String');
    this.extractor = selector;
  }

  Future<Document> _generateDOM(String html,
      {String encoding = 'UTF-8', String baseUri}) async {
    if (!(html is String) || html.isEmpty) return null;
    return parse(html, encoding: encoding, sourceUrl: baseUri);
  }

  @override
  Future<String> findIn(String data,
      {String encoding = 'UTF-8', String baseUri}) async {
    final Document el =
        await _generateDOM(data, encoding: encoding, baseUri: baseUri);
    return el?.querySelector(this.extractor)?.toString();
  }

  @override
  Future<Iterable<String>> findAllIn(String data,
      {String encoding = 'UTF-8', String baseUri}) async {
    final Document el =
        await _generateDOM(data, encoding: encoding, baseUri: baseUri);
    return el?.querySelectorAll(this.extractor)?.map((e) => e.toString());
  }
}
