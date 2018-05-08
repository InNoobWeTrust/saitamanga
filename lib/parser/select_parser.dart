import 'dart:async';
import 'dart:html';

import 'parser.dart' show Parser;

class SelectParser implements Parser {
  @override
  String extractor;

  SelectParser(String selector) {
    assert(selector is String);
    if (selector.isEmpty) throw ArgumentError('selector must not be an empty');
    this.extractor = selector;
  }

  Future<Element> _generateDOM(String html) async {
    if (!(html is String) || html.isEmpty) return null;
    return new Element.html(html);
  }

  @override
  Future<String> findIn(String data) async {
    final Element el = await _generateDOM(data);
    return el?.querySelector(this.extractor)?.toString();
  }

  @override
  Future<Iterable<String>> findAllIn(String data) async {
    final Element el = await _generateDOM(data);
    return el?.querySelectorAll(this.extractor)?.map((e) => e.toString());
  }
}
