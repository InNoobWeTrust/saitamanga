import 'parser_strategy.dart' show ParserStrategy;
import '../parser.dart' show Parser;
import '../const/strategy.dart' show Strategy;
import 'delegate_parse_processor.dart' show DelegateParseProcessor;
import 'delegate_parser.dart' show DelegateParser;
import './html/select_parser.dart' show SelectParser;
import './html/delegate_select_parser.dart' show DelegateSelectParser;

class ParserStrategyGenerator {
  final DelegateParseProcessor processor;
  final Strategy default_strategy;

  ParserStrategyGenerator({this.processor, this.default_strategy = null});

  ParserStrategy generateStrategy(Parser parser) {
    final chosen_strategy =
        parser.strategy != null ? parser.strategy : default_strategy;
    if (chosen_strategy == null) return null;
    switch (chosen_strategy) {
      case Strategy.html__select:
        return SelectParser(parser.amount, parser.instructions);
        break;
      case Strategy.delegate:
        return DelegateParser(
            parser.amount, parser.instructions, this.processor);
        break;
      case Strategy.html__delegate_select:
        return DelegateSelectParser(
            parser.amount, parser.instructions, this.processor);
        break;
    }
    return null;
  }
}
