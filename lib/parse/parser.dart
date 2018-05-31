import 'dart:async' show Future;

import 'parser_type.dart' show ParserType;
import 'mixins/config_helper.dart' show ConfigHelper;

abstract class Parser extends Object with ConfigHelper {
  ParserType type;

  Map<String, String> configs;

  final List<String> requiredConfigKeys;

  Parser loadConfig(Map<String, String> configs) {
    final Set<dynamic> checkResult = checkConfig(configs);
    if (!(checkResult.first as bool))
      throw ArgumentError(checkResult.last as String);
    return this..configs = checkResult.last as Map<String, String>;
  }

  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources
  ///   - [String]        for other sources
  Future<Iterable<String>> findIn(dynamic data);
}
