import '../../parse/parser_type.dart' show ParserType;
import '../../parse/parser_group.dart' show ParserGroup;
import '../../parse/html/select_parser.dart' show SelectParser;

abstract class ParserLoader {
  List<String> parserIdentifierKeys = const ['use', 'type', 'config'];

  /// Will throw Exception if the config
  /// is not in the right format
  ParserGroup loadParserGroup(Map<String, dynamic> config) {
    ParserGroup parserGroup = new ParserGroup();
    for (MapEntry<String, dynamic> entry in config.entries) {
      if (entry.value is! Map<String, dynamic>) {
        throw ArgumentError(
            '[Parser Group Loader] Parser-Group\'s config is malformed!');
      }
      Map<String, dynamic> parserConfig = entry.value;
      if (parserConfig.keys
              .where((key) => parserIdentifierKeys.contains(key))
              .length !=
          parserIdentifierKeys.length) {
        throw ArgumentError(
            '[Parser Group Loader] Not all required keys found! ${parserConfig.toString()}');
      }
      for (String key in const ['type', 'use']) {
        if (parserConfig[key] is! String) {
          throw ArgumentError(
              '[Parser Group Loader] "${key}" must contain a String value!');
        }
      }
      if (parserConfig['config'] is! Map<String, String>) {
        throw ArgumentError(
            '[Parser Group Loader] Parser\'s config is malformed!');
      }
      ParserType type;
      switch ((parserConfig['type'] as String).toLowerCase()) {
        case 'single':
          type = ParserType.SINGLE;
          break;
        case 'multiple':
          type = ParserType.MULTIPLE;
          break;
        default:
          throw ArgumentError('[Parser Group Loader] "type" must be either '
              'SINGLE or MULTIPLE!');
          break;
      }
      switch ((parserConfig['use'] as String).toLowerCase()) {
        case "selector":
          SelectParser selectParser =
              new SelectParser(type, configs: parserConfig['config']);
          parserGroup.addParser(entry.key, selectParser);
          break;
        default:
          throw ArgumentError(
              '[Parser Group Loader] The specific type of parser specified '
              '(${parserConfig['use']}) is not supported\n');
          break;
      }
    }
    return parserGroup;
  }
}
