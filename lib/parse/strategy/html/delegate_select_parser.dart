import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document;

import '../parser_strategy.dart' show ParserStrategy;
import '../../const/amount.dart' show Amount;
import '../delegate_parse_processor.dart' show DelegateParseProcessor;
import 'utils/selector.dart' show Selector;

class DelegateSelectParser extends ParserStrategy {
  final Amount amount;
  final Map<String, String> instructions;
  final DelegateParseProcessor processor;
  final String selector;
  final String attribute;

  DelegateSelectParser(this.amount, this.instructions, this.processor)
      : this.selector = instructions['selector'],
        this.attribute = instructions['attribute'];

  /// The type of [data] here is [Document]
  ///
  /// Note: Will return null if the [processor] of this object is null
  @override
  Stream<String> streamParse(dynamic data) {
    final Stream<String> selected =
        Selector.select(data as Document, selector, attribute);
    return processor?.process(selected);
  }
}
