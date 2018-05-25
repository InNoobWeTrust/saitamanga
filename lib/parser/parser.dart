import 'dart:async' show Future;

enum ParserType { SINGLE, MULTIPLE }

abstract class Parser {
  ParserType type;

  /// Parse and return the parsed result
  /// 
  /// Returns:
  ///   - [Future<String>]      for [ParserType.SINGLE]
  ///   - [Iterable<String>]    for [ParserType.MULTIPLE]
  ///   - [Stream<String>]      for [ParserType.MULTIPLE]
  Future<dynamic> findIn(String data);
}
