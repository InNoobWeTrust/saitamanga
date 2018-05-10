import 'dart:async';

import 'package:html/dom.dart' show Document, Element;

abstract class Selector {
  String selector;
  String attribute;

  Future<String> extract(Document dom) async {
    final Element el = dom?.querySelector(selector);
    return attribute.isNotEmpty ? el?.attributes[attribute] : el?.text;
  }

  Future<List<String>> extractAll(Document dom) async {
    final List<Element> elems = dom?.querySelectorAll(selector);
    return attribute.isNotEmpty
        ? elems?.map((e) => e.attributes[attribute])
        : elems?.map((e) => e.text);
  }
}