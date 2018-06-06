import 'package:tuple/tuple.dart' show Tuple2;

import '../../constant/parser_constant.dart' show ParserConstant;

abstract class ParserCheck {
  Tuple2<bool, String> checkParserConfig(Map<String, dynamic> config) {
    if (config.keys
            .where((key) => ParserConstant.parserMasterKeys.contains(key))
            .length !=
        ParserConstant.parserMasterKeys.length) {
      return Tuple2<bool, String>(
          false, 'Not all required keys found! ${config.toString()}');
    }
    for (String key in ParserConstant.parserStringKeys) {
      if (config[key] is! String) {
        return Tuple2<bool, String>(
            false, '"${key}" must contain a String value!');
      }
    }
    for (String key in ParserConstant.parserMapKeys) {
      if (config[key] is! Map<String, String>) {
        return Tuple2<bool, String>(false, '${key} must contain a Map value!');
      }
    }
    if (!ParserConstant.parseTypeMap.keys
        .contains((config['type'] as String).toLowerCase())) {
      return Tuple2<bool, String>(false, '"type" contain invalid value!');
    }
    if (ParserConstant.parserTypeMap.keys
        .contains((config['use'] as String).toLowerCase())) {
      return Tuple2<bool, String>(
          false,
          'The type of parser specified '
          '(${config['use']}) is not available\n');
    }
    return Tuple2<bool, String>(true, null);
  }
}
