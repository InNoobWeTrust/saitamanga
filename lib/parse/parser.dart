import 'dart:async' show Stream;

import 'parse_type.dart' show ParseType;

abstract class Parser {
  ParseType get parseType;

  Map<String, String> get instructions;

  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources
  ///   - [String]        for other sources
  Stream<String> findIn(dynamic data);

  @override
  String toString() {
    return "{parseType: ${this.parseType}, configs: ${this.instructions}}";
  }
}
