import 'dart:async' show Future;

import 'package:tuple/tuple.dart' show Tuple2;

import 'parser_type.dart' show ParserType;
import 'mixins/config_helper.dart' show ConfigHelper;

abstract class Parser extends Object with ConfigHelper {
  ParserType type;

  Map<String, String> configs;

  final List<String> requiredConfigKeys;

  Parser loadConfig(Map<String, String> configs) {
    final Tuple2<bool, dynamic> checkResult = checkConfig(configs);
    if (!checkResult.item1)
      throw ArgumentError(checkResult.item2 as String);
    return this..configs = checkResult.item2 as Map<String, String>;
  }

  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources
  ///   - [String]        for other sources
  Future<Iterable<String>> findIn(dynamic data);
}
