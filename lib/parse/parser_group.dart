import 'dart:async' show Stream;

import 'parser.dart';

class ParserGroup {
  Map<String, Parser> parsers;

  ParserGroup({this.parsers});

  ParserGroup setParsers(Map<String, Parser> parsers) =>
      this..parsers = parsers;

  ParserGroup addParsers(Map<String, Parser> parsers) {
    if (this.parsers == null) this.parsers = new Map<String, Parser>();
    return this..parsers.addAll(parsers);
  }

  ParserGroup addParser(String name, Parser parser) {
    if (this.parsers == null) this.parsers = new Map<String, Parser>();
    return this..parsers[name] = parser;
  }

  /// The type of [data] varies in different sources
  ///
  /// Refer to [Parser.findIn()] for more information
  Stream<MapEntry<String, Iterable<String>>> parse(dynamic data) async* {
    assert(this.parsers != null && this.parsers.isNotEmpty);
    for (MapEntry<String, Parser> entry in this.parsers.entries) {
      yield new MapEntry<String, Iterable<String>>(
          entry.key, await entry.value.findIn(data));
    }
  }
}
