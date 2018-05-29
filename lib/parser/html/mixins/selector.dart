import 'dart:async' show Future;

import 'package:html/dom.dart' show Document, Element;

abstract class Selector {
  static const List<String> CONFIG_KEYS = ['selector', 'attribute'];
  Map<String, String> configs;

  Future<String> select(Document dom) async {
    final Element el = dom?.querySelector(configs['selector']);
    return configs['attribute'].isNotEmpty ? el?.attributes[configs['attribute']] : el?.text;
  }

  Future<List<String>> selectAll(Document dom) async {
    final List<Element> elems = dom?.querySelectorAll(configs['selector']);
    return configs['attribute'].isNotEmpty
        ? elems?.map((e) => e.attributes[configs['attribute']])
        : elems?.map((e) => e.text);
  }
}