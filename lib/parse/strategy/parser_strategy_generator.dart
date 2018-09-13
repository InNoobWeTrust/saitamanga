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

  void injectStrategy(Parser parser) {
    switch (parser.strategy) {
      case Strategy.html__select:
        ParserStrategy parserStrategy = SelectParser(
            amount: parser.amount, instructions: parser.instructions);
        parser.injectParserStrategy(parserStrategy);
        break;
      case Strategy.delegate:
        ParserStrategy parserStrategy = DelegateParser(
            amount: parser.amount,
            instructions: parser.instructions,
            processor: this.processor);
        parser.injectParserStrategy(parserStrategy);
        break;
      case Strategy.html__delegate_select:
        ParserStrategy parserStrategy = DelegateSelectParser(
            amount: parser.amount,
            instructions: parser.instructions,
            processor: this.processor);
        parser.injectParserStrategy(parserStrategy);
        break;
    }
  }
}
