import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document;

import 'parser_strategy.dart' show ParserStrategy;
import '../const/amount.dart' show Amount;
import 'delegate_parse_processor.dart' show DelegateParseProcessor;

class DelegateParser extends ParserStrategy {
  final Amount amount;
  final Map<String, String> instructions;
  final DelegateParseProcessor processor;

  DelegateParser({this.amount, this.instructions, this.processor});

  /// The type of [data] here is [Document]
  ///
  /// Note: Will return null if the [processor] of this object is null
  @override
  Stream<String> streamParse(dynamic data) => processor?.process(data);
}
