import 'dart:async';

import '../../parser/parser.dart' show Parser;

abstract class Extractor {
  Map<String, Parser> parsers;

  Extractor setParsers(Map<String, Parser> parsers) => this..parsers = parsers;

  Extractor setParser(String name, Parser parser) {
    if (this.parsers == null) this.parsers = new Map<String, Parser>();
    return this..parsers[name] = parser;
  }

  Stream<dynamic> extract(String data) async* {
    if (parsers == null || parsers.isEmpty)
      throw StateError("Trying to extract data without setting any parser!");
    for (String name in this.parsers.keys) {
      yield await parsers[name].findIn(data);
    }
  }
}