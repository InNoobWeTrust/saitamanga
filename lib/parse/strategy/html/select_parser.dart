import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document;

import '../parser_strategy.dart' show ParserStrategy;
import '../../const/amount.dart' show Amount;
import 'utils/selector.dart' show Selector;

class SelectParser extends ParserStrategy {
  final Amount amount;
  final String selector;
  final String attribute;

  SelectParser(this.amount, instructions)
      : this.selector = instructions['selector'],
        this.attribute = instructions['attribute'];

  /// The type of [data] here is [Document]
  @override
  Stream<String> streamParse(dynamic data) {
    switch (amount) {
      case Amount.single:
        return Selector.select(data as Document, selector, attribute);
        break;
      case Amount.multiple:
        return Selector.selectAll(data as Document, selector, attribute);
        break;
    }
    throw Exception("The code shouldn't freaking reach here...😱");
  }
}
