import 'package:tuple/tuple.dart' show Tuple2;

import '../../../parse/parser_constant.dart' show ParserConstant;

abstract class ParserCheck {
  /// Prefer fail-first approach
  Tuple2<bool, String> checkParserConfig(Map<String, dynamic> config) {
    for (Function func in [
      _checkMasterKeys,
      _checkStringKeys,
      _checkMapKeys,
      _checkParseTypes,
      _checkParsers,
      _checkConfigConfigs,
    ]) {
      Tuple2<bool, String> check = func(config);
      if (!check.item1) return check;
    }
    return Tuple2<bool, String>(true, null);
  }

  Tuple2<bool, String> _checkMasterKeys(Map<String, dynamic> config) =>
      Tuple2<bool, String>(
          config.keys
                  .where((key) => ParserConstant.masterKeys.contains(key))
                  .length ==
              ParserConstant.masterKeys.length,
          'Not all required keys for parser found!\n'
          'Config:\n${config.toString()}');

  Tuple2<bool, String> _checkStringKeys(Map<String, dynamic> config) =>
      Tuple2<bool, String>(

          /// Sacrifice minor performance gain for readability.
          /// For performance, prefer fail-first and use [map]=>[any]
          /// and then toggle the resulting boolean
          ParserConstant.stringKeys
              .map((key) => config[key])
              .every((value) => value is String),
          'Any of these keys "${ParserConstant.stringKeys.toString()}" '
          'must contain a String value!\n'
          'Config:\n${config.toString()}');

  Tuple2<bool, String> _checkMapKeys(Map<String, dynamic> config) =>
      Tuple2<bool, String>(

          /// Sacrifice minor performance gain for readability.
          /// For performance, prefer fail-first and use [map]=>[any]
          /// and then toggle the resulting boolean
          ParserConstant.stringKeys
              .map((key) => config[key])
              .every((value) => value is Map<String, String>),
          'Any of these keys "${ParserConstant.stringKeys.toString()}" '
          'must contain a String value!\n'
          'Config:\n${config.toString()}');

  Tuple2<bool, String> _checkParseTypes(Map<String, dynamic> config) =>
      Tuple2<bool, String>(
          ParserConstant.parseTypes.keys
              .contains((config['type'] as String).toLowerCase()),
          '"type" contain invalid value!\nConfig:\n${config.toString()}');

  Tuple2<bool, String> _checkParsers(Map<String, dynamic> config) =>
      Tuple2<bool, String>(
          ParserConstant.parsers.keys
              .contains((config['use'] as String).toLowerCase()),
          'The type of parser specified '
          '(${config['use']}) is not available\n');

  Tuple2<bool, String> _checkConfigConfigs(Map<String, dynamic> config) {
    List<String> requiredKeys =
        ParserConstant.requiredConfigKeys[config['use']];
    Map<String, String> configConfigs = config['config'] as Map<String, String>;
    if (requiredKeys.every((key) => configConfigs.keys.contains(key)))
      return Tuple2<bool, String>(true, null);
    return Tuple2<bool, String>(
        false,
        'The configs for ${requiredKeys} does not contains '
        'all the required keys!\nConfig:\n${config.toString()}');
  }
}
