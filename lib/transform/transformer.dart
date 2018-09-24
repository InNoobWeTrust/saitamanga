import 'dart:async' show Future, Stream;

import '../parse/parse_element.dart' show ParseElement;
import '../parse/parse_product.dart' show ParseProduct;
import '../parse/strategy/parser_strategy_generator.dart'
    show ParserStrategyGenerator;

class Transformer {
  final List<ParseElement> parseElements;
  final ParserStrategyGenerator strategyGenerator;

  Transformer(this.parseElements, this.strategyGenerator);

  /// Remember to preprocess the data with [PreProcessor]
  /// before feeding into this
  ///
  Future<Stream<ParseProduct>> transform(dynamic preprocessedData) async {
    return Stream.fromIterable(this.parseElements)
        .asyncMap((e) => e.parse(preprocessedData, strategyGenerator));
  }
}
