import '../../config/view_config.dart' show ViewConfig;
import '../../config/parser_config.dart' show ParserConfig;
import '../../config/const/strategy.dart' show Strategy;
import '../../config/const/amount.dart' show Amount;
import './delegate/delegate_parse_processor.dart' show DelegateParseProcessor;
import './delegate/delegate_parser.dart' show DelegateParser;
import './html/css_select/select_parser.dart' show SelectParser;
import './html/mixed/select_delegate_parser.dart' show SelectDelegateParser;
import './parse_strategy.dart' show ParseStrategy;

/// Provide the right strategy to corresponding [Parser]
class ParseStrategist {
  final DelegateParseProcessor processor;
  final ViewConfig viewConfig;

  ParseStrategist(this.processor, this.viewConfig);

  /// Give strategy's worker to do the parse
  ParseStrategy provideStrategy(ParserConfig parserConfig, Amount amount) {
    switch (parserConfig.strategy ?? viewConfig.defaultStrategy) {
      case Strategy.html__css_select:
        return SelectParser(amount, parserConfig.instruction);
        break;
      case Strategy.html__delegate:
        return DelegateParser(amount, parserConfig.instruction, this.processor);
        break;
      case Strategy.html__mixed__select_delegate:
        return SelectDelegateParser(
            amount, parserConfig.instruction, this.processor);
        break;
    }
    return null;
  }
}
