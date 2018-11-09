import 'dart:async' show Stream;

import '../config/view_config.dart' show ViewConfig;
import '../config/parse_element_config.dart' show ParseElementConfig;
import '../parse/parser.dart' show Parser;
import '../parse/parse_product.dart' show ParseProduct;
import '../parse/strategy/parse_strategist.dart' show ParseStrategist;
import '../parse/strategy/delegate/delegate_parse_processor.dart'
    show DelegateParseProcessor;
import '../preprocess/preprocessor.dart' show PreProcessor;
import '../preprocess/const/preprocess_type.dart' show PreprocessType;

/// Transform raw data into [ParseProduct]
class Transformer {
  final ViewConfig viewConfig;
  final ParseStrategist strategist;

  Transformer(this.viewConfig, DelegateParseProcessor processor)
      : this.strategist = ParseStrategist(processor, viewConfig);

  /// Transform the data into a stream of ParseProduct. Preprocessed data is
  /// generated on-the-fly and cached for reuse. May cause performance impact
  /// on runtime with low memory when use parsers with alot distinct
  /// [PreprocessType]
  Stream<ParseProduct> transform(
    String rawData,
    Map<String, dynamic> metadata,
  ) async* {
    final Map<PreprocessType, dynamic> cache = <PreprocessType, dynamic>{};
    for (ParseElementConfig element in viewConfig.elements) {
      final dynamic preprocessed = cache.putIfAbsent(
          element.preprocessType,
          () => PreProcessor.preprocess(
                rawData,
                element.preprocessType ?? viewConfig.defaultPreprocessType,
                metadata,
              ));
      yield await Parser.parse(
        element,
        preprocessed,
        strategist,
      );
    }
  }
}
