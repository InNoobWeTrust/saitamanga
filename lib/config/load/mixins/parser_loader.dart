import '../../../parse/parser_constant.dart' show ParserConstant;
import '../../../parse/html/delegate_select_parser.dart'
    show DelegateSelectParser;
import '../../../parse/delegate_parse_processor.dart'
    show DelegateParseProcessor;
import '../../../parse/parse_type.dart' show ParseType;
import '../../../parse/parser_group.dart' show ParserGroup;
import '../../../parse/html/select_parser.dart' show SelectParser;

abstract class ParserLoader {
  /// Remember to run the check for the whole source's config before loading
  ///
  /// Will throw Exception if the config is not in the right format
  ///
  /// Note: In case of [DelegateSelectParser], must specify
  /// the [DelegateProcessor] or the parsing will get null result
  ParserGroup loadParserGroup(Map<String, dynamic> config,
      {DelegateParseProcessor processor}) {
    ParserGroup parserGroup = new ParserGroup();
    for (MapEntry<String, dynamic> entry in config.entries) {
      Map<String, dynamic> parserConfig = entry.value;
      ParseType parseType = ParserConstant
          .parseTypes[(parserConfig['type'] as String).toLowerCase()];
      Type parser =
          ParserConstant.parsers[(parserConfig['use'] as String).toLowerCase()];
      switch (parser) {
        case SelectParser:
          SelectParser selectParser = new SelectParser(parseType,
              instructions: parserConfig['config'].cast<String, String>());
          parserGroup.addParser(entry.key, selectParser);
          break;
        case DelegateSelectParser:
          DelegateSelectParser delegateSelectParser = new DelegateSelectParser(
              parseType,
              instructions: parserConfig['config'].cast<String, String>());
          parserGroup.addParser(entry.key, delegateSelectParser);
          break;
        default:
          break;
      }
    }
    return parserGroup;
  }
}
