import '../../parse/parse_type.dart' show ParseType;
import '../../parse/html/delegate_select_parser.dart' show DelegateSelectParser;
import '../../parse/html/select_parser.dart' show SelectParser;

class ParserConstant {
  static const List<String> parserMasterKeys = const ['use', 'type', 'config'];
  static const List<String> parserStringKeys = const ['use', 'type'];
  static const List<String> parserMapKeys = const ['config'];
  static const Map<String, ParseType> parseTypeMap = const {
    'single': ParseType.SINGLE,
    'multiple': ParseType.MULTIPLE
  };
  static const Map<String, Type> parserTypeMap = const {
    'html/select_parser': SelectParser,
    'html/delegate_select_parser': DelegateSelectParser
  };
}
