import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document, Element;

import './selector_instruction.dart' show SelectorInstruction;

/// The functional part of CSS-Selector [ParseStrategy]
class Selector {
  /// Select single HTML Node
  static Stream<String> select(
      Document dom, SelectorInstruction instruction) async* {
    final Element el = dom?.querySelector(instruction.selector);
    if (el == null) return;
    yield _firstValid(el, instruction);
  }

  /// Select all satisfying HTML Node
  static Stream<String> selectAll(
      Document dom, SelectorInstruction instruction) {
    final List<Element> elems = dom?.querySelectorAll(instruction.selector);
    return Stream.fromIterable(elems.map((e) => _firstValid(e, instruction)));
  }

  static String _firstValid(Element elem, SelectorInstruction instruction) {
    if (instruction.attribute == null) {
      return elem.text;
    } else if (instruction.alternateAttribute == null) {
      return elem.attributes[instruction.attribute];
    } else {
      return elem.attributes[instruction.attribute] ??
          elem.attributes[instruction.alternateAttribute];
    }
  }
}
