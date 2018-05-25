import 'dart:async' show Future, Stream;

import 'parser.dart' show Parser, ParserType;

class ParserGroup {
  Map<String, Parser> parsers;

  ParserGroup setParsers(Map<String, Parser> parsers) {
    assert(parsers.values.any((parser) => parser.type != ParserType.MULTIPLE));
    return this..parsers = parsers;
  }

  ParserGroup addParsers(Map<String, Parser> parsers) {
    assert(parsers.values.any((parser) => parser.type != ParserType.MULTIPLE));
    if (this.parsers == null) this.parsers = new Map<String, Parser>();
    return this..parsers.addAll(parsers);
  }

  ParserGroup addParser(String name, Parser parser) {
    assert(parser.type != ParserType.MULTIPLE);
    if (this.parsers == null) this.parsers = new Map<String, Parser>();
    return this..parsers[name] = parser;
  }

  /// Stream the extracted information for each parser in the group
  /// 
  /// Each item is a [Map] of [{String:dynamic}] which
  /// the [dynamic] part is what return from [Parser.findIn()]
  Stream<Map<String, dynamic>> streamFindIn(String data) async* {
    for (String name in this.parsers.keys) {
      yield {name: await this.parsers[name].findIn(data)};
    }
  }

  /// Similar to [Parser.findIn()], but this one 
  /// contains a [Map] of [{String:dynamic}] where
  /// the inner [dynamic] is the actual information return
  /// from [Parser.findIn()]
  Future<Map<String, dynamic>> findIn(String data) async {
    return streamFindIn(data)
        .fold(new Map<String, dynamic>(), (acc, item) => acc..addAll(item));
  }
}
