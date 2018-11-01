import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document;

import '../../../../config/const/amount.dart' show Amount;
import '../../parse_strategy.dart' show ParseStrategy;
import '../../delegate/delegate_parse_processor.dart'
    show DelegateParseProcessor;
import '../css_select/selector_instruction.dart' show SelectorInstruction;
import '../css_select/selector.dart' show Selector;

/// This strategy first use CSS Selector to filter the data then delegate the
/// filterd data
class SelectDelegateParser extends ParseStrategy {
  final Amount amount;
  final SelectorInstruction selectorInstruction;
  final Map<String, dynamic> rawInstruction;
  final DelegateParseProcessor processor;

  SelectDelegateParser(this.amount, this.rawInstruction, this.processor)
      : this.selectorInstruction = SelectorInstruction.fromJson(rawInstruction);

  /// The type of [data] here is [Document]
  ///
  /// Note: Will return null if the [processor] of this object is null
  @override
  Stream<String> streamParse(dynamic data) {
    final Stream<String> selected =
        Selector.select(data as Document, this.selectorInstruction);
    return processor?.process(selected, instructions: rawInstruction);
  }
}
