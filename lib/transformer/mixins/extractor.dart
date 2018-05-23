import 'dart:async';

import '../../parser/parser.dart' show Parser;

class Extractor {
  Map<String, Parser> parsers;

  Extractor setParsers(Map<String, Parser> parsers) => this..parsers = parsers;

  Extractor setParser(String name, Parser parser) {
    if (this.parsers == null) this.parsers = new Map<String, Parser>();
    return this..parsers[name] = parser;
  }

  Future<String> transform(String parserName, String data) {
    return this.parsers[parserName].findIn(data);
  }

  Future<List<String>> transformAll(String parserName, String data) {
    return this.parsers[parserName].findAllIn(data);
  }
}