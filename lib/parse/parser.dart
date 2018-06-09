import 'dart:async' show Stream;

import 'parse_type.dart' show ParseType;

abstract class Parser {
  ParseType parseType;

  Map<String, String> configs;

  static List<String> requiredConfigKeys;

  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources
  ///   - [String]        for other sources
  Stream<String> findIn(dynamic data);
}
