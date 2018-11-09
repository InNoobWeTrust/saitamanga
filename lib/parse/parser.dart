import '../config/parse_element_config.dart' show ParseElementConfig;
import '../config/parser_config.dart' show ParserConfig;
import '../config/const/role.dart' show Role;
import './parse_product.dart' show ParseProduct;
import './strategy/parse_strategist.dart' show ParseStrategist;

/// Do the actual parse from raw data into [ParseProduct]
class Parser {
  /// The type of [preprocessedData] varies in different sources.
  /// Refer to [Parser.streamParse()] for more information
  static Future<ParseProduct> parse(
    ParseElementConfig parseElementConfig,
    dynamic preprocessedData,
    ParseStrategist parseStrategist,
  ) async {
    List<String> primary;
    List<Uri> link;
    Map<String, List<String>> meta;
    for (ParserConfig parserConfig in parseElementConfig.parserConfigs) {
      switch (parserConfig.role) {
        case Role.primary:
          primary = await parseStrategist
              .provideStrategy(
                parserConfig,
                parseElementConfig.amount,
              )
              .streamParse(preprocessedData)
              .toList();
          break;
        case Role.link:
          link = await parseStrategist
              .provideStrategy(
                parserConfig,
                parseElementConfig.amount,
              )
              .streamParse(preprocessedData)
              .map((s) => Uri.tryParse(s))
              .toList();
          break;
        case Role.meta:
          meta[parserConfig.name ?? "_"] = await parseStrategist
              .provideStrategy(
                parserConfig,
                parseElementConfig.amount,
              )
              .streamParse(preprocessedData)
              .toList();
          break;
      }
    }
    return ParseProduct(
      parseElementConfig.id,
      parseElementConfig.name,
      parseElementConfig.target,
      parseElementConfig.icon,
      primary,
      link,
      meta,
    );
  }
}
