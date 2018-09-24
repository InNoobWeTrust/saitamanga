import 'parser_strategy.dart' show ParserStrategy;
import '../parser.dart' show Parser;
import '../const/strategy.dart' show Strategy;
import 'delegate_parse_processor.dart' show DelegateParseProcessor;
import 'delegate_parser.dart' show DelegateParser;
import './html/select_parser.dart' show SelectParser;
import './html/delegate_select_parser.dart' show DelegateSelectParser;

class ParserStrategyGenerator {
  final DelegateParseProcessor processor;

  ParserStrategyGenerator({this.processor});

  ParserStrategy generateStrategy(Parser parser) {
    switch (parser.strategy) {
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
