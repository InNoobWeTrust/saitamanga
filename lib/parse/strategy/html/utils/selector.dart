import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document, Element;

class Selector {
  static Stream<String> select(
      Document dom, String selector, String attribute) async* {
    final Element el = dom?.querySelector(selector);
    if (el == null) return;
    yield attribute.isNotEmpty ? el.attributes[attribute] : el.text;
  }

  static Stream<String> selectAll(
      Document dom, String selector, String attribute) {
    final List<Element> elems = dom?.querySelectorAll(selector);
    return Stream.fromIterable(attribute.isNotEmpty
        ? elems?.map((e) => e.attributes[attribute])
        : elems?.map((e) => e.text));
  }
}
