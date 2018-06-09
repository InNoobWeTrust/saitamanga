import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document, Element;

abstract class Selector {
  static const List<String> CONFIG_KEYS = ['selector', 'attribute'];
  Map<String, String> configs;

  Stream<String> select(Document dom) async* {
    final Element el = dom?.querySelector(configs['selector']);
    yield configs['attribute'].isNotEmpty
        ? el?.attributes[configs['attribute']]
        : el?.text;
  }

  Stream<String> selectAll(Document dom) async* {
    final List<Element> elems = dom?.querySelectorAll(configs['selector']);
    List<String> raw = configs['attribute'].isNotEmpty
        ? elems?.map((e) => e.attributes[configs['attribute']])
        : elems?.map((e) => e.text);
    for (String str in raw) yield str;
  }
}
