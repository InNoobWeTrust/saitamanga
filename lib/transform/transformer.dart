import 'dart:async' show Future, Stream;

import '../parse/parse_element.dart' show ParseElement;
import '../parse/parse_product.dart' show ParseProduct;
import '../parse/strategy/parser_strategist.dart' show ParserStrategist;

class Transformer {
  final List<ParseElement> parseElements;
  final ParserStrategist strategist;

  Transformer(this.parseElements, this.strategist);

  /// Remember to preprocess the data with [PreProcessor]
  /// before feeding into this
  ///
  Future<Stream<ParseProduct>> transform(dynamic preprocessedData) async {
    return Stream.fromIterable(this.parseElements)
        .asyncMap((e) => e.parse(preprocessedData, strategist));
  }
}
