import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import '../parse_type.dart' show ParseType;
import 'mixins/selector.dart' show Selector;

class SelectParser extends Parser with Selector {
  @override
  ParseType parseType;
  @override
  Map<String, String> configs;

  SelectParser(this.parseType, {this.configs});

  /// The type of [data] here is [Document]
  @override
  Stream<String> findIn(dynamic data) {
    if (parseType == ParseType.SINGLE)
      return select(data as Document);
    else
      return selectAll(data as Document);
  }
}
