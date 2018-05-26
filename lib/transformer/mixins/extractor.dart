import 'dart:async' show Stream;

import '../../parser/parser.dart' show Parser;

abstract class Extractor {
  Map<String, Parser> parsers;

  Stream<MapEntry<String, Iterable<String>>> extract(String data) async* {
    assert(parsers != null && parsers.isNotEmpty);
    for (MapEntry<String, Parser> entry in this.parsers.entries) {
      yield new MapEntry<String, Iterable<String>>(
          entry.key, await entry.value.findIn(data));
    }
  }
}
