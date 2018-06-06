import '../../constant/parser_constant.dart' show ParserConstant;
import '../../../parse/html/delegate_select_parser.dart' show DelegateSelectParser;
import '../../../parse/parse_type.dart' show ParseType;
import '../../../parse/parser_group.dart' show ParserGroup;
import '../../../parse/html/select_parser.dart' show SelectParser;

abstract class ParserLoader {
  /// Remember to run the check for the whole source's config before loading
  ///
  /// Will throw Exception if the config is not in the right format
  ///
  /// Note: In case of [DelegateSelectParser], must manually inject
  /// the [DelegateProcessor] before parsing, or else will get null result
  ParserGroup loadParserGroup(Map<String, dynamic> config) {
    ParserGroup parserGroup = new ParserGroup();
    for (MapEntry<String, dynamic> entry in config.entries) {
      Map<String, dynamic> parserConfig = entry.value;
      ParseType parseType = ParserConstant
          .parseTypeMap[(parserConfig['type'] as String).toLowerCase()];
      Type parserType = ParserConstant
          .parserTypeMap[(parserConfig['use'] as String).toLowerCase()];
      switch (parserType) {
        case SelectParser:
          SelectParser selectParser =
              new SelectParser(parseType, configs: parserConfig['config']);
          parserGroup.addParser(entry.key, selectParser);
          break;
        case DelegateSelectParser:
          DelegateSelectParser delegateSelectParser = new DelegateSelectParser(
              parseType,
              configs: parserConfig['config']);
          parserGroup.addParser(entry.key, delegateSelectParser);
          break;
        default:
          break;
      }
    }
    return parserGroup;
  }
}
