import 'dart:async' show Future, Stream;

import '../parse/parse_element.dart' show ParseElement;
import '../parse/parse_product.dart' show ParseProduct;
import '../parse/strategy/parser_strategy_generator.dart'
    show ParserStrategyGenerator;

class Transformer {
  List<ParseElement> parseElements;
  ParserStrategyGenerator strategyGenerator;

  Transformer({this.parseElements, this.strategyGenerator});

  Transformer setParseElements(List<ParseElement> parserElements) =>
      this..parseElements = parserElements;

  Transformer setStrategyGenerator(ParserStrategyGenerator strategyGenerator) =>
      this..strategyGenerator = strategyGenerator;

  /// Remember to preprocess the data with [PreProcessor]
  /// before feeding into this
  ///
  Future<Stream<ParseProduct>> transform(dynamic preprocessedData) async {
    parseElements.forEach(
        (e) => e.parsers.forEach((p) => strategyGenerator.injectStrategy(p)));
    return Stream.fromIterable(this.parseElements)
        .asyncMap((e) => e.parse(preprocessedData));
  }
}
