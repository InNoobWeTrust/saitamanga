import 'dart:async' show Stream;

import '../../../config/const/amount.dart' show Amount;
import '../parse_strategy.dart' show ParseStrategy;
import './delegate_parse_processor.dart' show DelegateParseProcessor;

/// A strategy that delegate the parsing
class DelegateParser extends ParseStrategy {
  final Amount amount;
  final Map<String, dynamic> instructions;
  final DelegateParseProcessor processor;

  DelegateParser(this.amount, this.instructions, this.processor);

  /// The type of [data] here is [String]
  ///
  /// Note: Will return null if the [processor] of this object is null
  @override
  Stream<String> streamParse(dynamic data) =>
      processor?.process(data, instructions: instructions);
}
