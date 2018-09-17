import 'dart:async' show Stream;

import '../parse/parse_element.dart' show ParseElement;
import '../parse/parse_product.dart' show ParseProduct;

class Transformer {
  List<ParseElement> parseElements;

  Transformer({this.parseElements});

  Transformer setParseElements(List<ParseElement> parserElements) =>
      this..parseElements = parserElements;

  /// Remember to preprocess the data with [PreProcessor]
  /// before feeding into this
  /// 
  /// TODO: try to think of a way to inject parseStrategy niccely into parsers
  Stream<ParseProduct> transform(dynamic preprocessedData) =>
      Stream.fromIterable(this.parseElements)
          .asyncMap((e) => e.parse(preprocessedData));
}
