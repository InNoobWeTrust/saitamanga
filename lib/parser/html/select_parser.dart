import 'dart:async';

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import 'mixins/dom_creator.dart' show DomCreator;
import 'mixins/selector.dart' show Selector;

class SelectParser extends Parser with DomCreator, Selector {
  String selector;
  String attribute;
  String encoding;
  String baseUri;

  SelectParser(this.selector, this.attribute,
      {this.encoding = 'utf-8', this.baseUri}) {
    assert(this.selector is String);
    assert(this.attribute is String);
    assert(this.encoding.isNotEmpty);
  }

  @override
  Future<String> findIn(String data) async {
    final Document dom = await generateDOM(data);
    final String extracted = await extract(dom);
    return extracted;
  }

  @override
  Future<Iterable<String>> findAllIn(String data) async {
    final Document dom = await generateDOM(data);
    final Iterable<String> extracted = await extractAll(dom);
    return extracted;
  }
}
