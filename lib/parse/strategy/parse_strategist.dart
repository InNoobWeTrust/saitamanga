import '../parser.dart' show Parser;
import '../const/strategy.dart' show Strategy;
import '../const/amount.dart' show Amount;
import 'parse_strategy.dart' show ParseStrategy;
import 'html/delegate/delegate_parse_processor.dart'
    show DelegateParseProcessor;
import 'html/delegate/delegate_parser.dart' show DelegateParser;
import 'html/css_select/select_parser.dart' show SelectParser;
import 'html/mixed/select_delegate_parser.dart' show SelectDelegateParser;

class ParseStrategist {
  final DelegateParseProcessor processor;
  final Strategy default_strategy;

  ParseStrategist(this.processor, this.default_strategy);

  ParseStrategy provideStrategy(Parser parser, Amount amount) {
    final chosen_strategy =
        parser.strategy != null ? parser.strategy : default_strategy;
    if (chosen_strategy == null) return null;
    switch (chosen_strategy) {
      case Strategy.html__css_select:
        return SelectParser(amount, parser.instruction);
        break;
      case Strategy.html__delegate:
        return DelegateParser(amount, parser.instruction, this.processor);
        break;
      case Strategy.html__mixed__select_delegate:
        return SelectDelegateParser(amount, parser.instruction, this.processor);
        break;
    }
    return null;
  }
}
