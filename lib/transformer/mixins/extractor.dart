import 'dart:async' show Stream;

import '../../parser/parser.dart' show Parser;
import '../../parser/parser_group.dart' show ParserGroup;

abstract class Extractor {
  /// [Map] that store [Parser] or [ParserGroup]
  Map<String, dynamic> parsers;

  Extractor setParsers(Map<String, dynamic> parsers) {
    assert(parsers.values.any((parser)=>!(parser is Parser || parser is ParserGroup)));
    return this..parsers = parsers;
  }

  Extractor addParsers(Map<String, dynamic> parsers) {
    assert(parsers.values.any((parser)=>!(parser is Parser || parser is ParserGroup)));
    if(this.parsers == null) this.parsers = new Map<String, dynamic>();
    return this..parsers.addAll(parsers);
  }

  Extractor setParser(String name, Parser parser) {
    assert(parsers.values.any((parser)=>!(parser is Parser || parser is ParserGroup)));
    if (this.parsers == null) this.parsers = new Map<String, dynamic>();
    return this..parsers[name] = parser;
  }

  /// Stream the extracted information from [String data]
  /// 
  /// Return a [Stream] that emit [Map] of [{String:dynamic}]
  ///   - If the key point to [Parser], the [dynamic] part
  ///    is what return from promise-resolved [Parser.findIn()]
  ///   - If the key point to [ParserGroup], the [dynamic] part
  ///    is another [Map] of [{String:dynamic}] where
  ///    the inner [dynamic] part is what
  ///    return from promise-resolved [Parser.findIn()]
  Stream<Map<String, dynamic>> extract(String data) async* {
    assert(parsers == null || parsers.isEmpty);
    for (String name in this.parsers.keys) {
      yield {name: await parsers[name].findIn(data)};
    }
  }
}