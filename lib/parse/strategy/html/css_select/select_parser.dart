import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document;

import '../../parse_strategy.dart' show ParseStrategy;
import '../../../../config/const/amount.dart' show Amount;
import './selector_instruction.dart' show SelectorInstruction;
import './selector.dart' show Selector;

/// This strategy use CSS Selector to parse
class SelectParser extends ParseStrategy {
  final Amount amount;
  final SelectorInstruction instruction;

  SelectParser(this.amount, Map<String, dynamic> instruction)
      : this.instruction = SelectorInstruction.fromJson(instruction);

  /// The type of [data] here is [Document]
  @override
  Stream<String> streamParse(dynamic data) {
    switch (amount) {
      case Amount.single:
        return Selector.select(data as Document, this.instruction);
        break;
      case Amount.multiple:
        return Selector.selectAll(data as Document, this.instruction);
        break;
    }
    throw Exception("The code shouldn't freaking reach here...😱");
  }
}
