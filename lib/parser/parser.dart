import 'dart:async' show Future;

import 'parser_type.dart' show ParserType;

abstract class Parser {
  ParserType type;

  Future<Iterable<String>> findIn(String data);
}
