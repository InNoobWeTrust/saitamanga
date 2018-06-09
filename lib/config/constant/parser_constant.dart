import '../../parse/parse_type.dart' show ParseType;
import '../../parse/html/delegate_select_parser.dart' show DelegateSelectParser;
import '../../parse/html/select_parser.dart' show SelectParser;

class ParserConstant {
  static const List<String> masterKeys = const ['use', 'type', 'config'];
  static const List<String> stringKeys = const ['use', 'type'];
  static const List<String> mapKeys = const ['config'];
  static const Map<String, ParseType> parseTypes = const {
    'single': ParseType.SINGLE,
    'multiple': ParseType.MULTIPLE
  };
  static const Map<String, Type> parsers = const {
    'html/select_parser': SelectParser,
    'html/delegate_select_parser': DelegateSelectParser
  };
}
