import 'dart:async' show Stream;

import '../../parser/parser_group.dart' show ParserGroup;

abstract class Extractor {
  Map<String, ParserGroup> parserGroups;

  Stream<MapEntry<String, Map<String, Iterable<String>>>> extract(
      String data) async* {
    assert(this.parserGroups != null && this.parserGroups.isNotEmpty);
    for (MapEntry<String, ParserGroup> entry in this.parserGroups.entries) {
      yield new MapEntry<String, Map<String, Iterable<String>>>(
          entry.key,
          await entry.value.parse(data).fold(
              new Map<String, Iterable<String>>(),
              (acc, curr) => acc..[curr.key] = curr.value));
    }
  }
}
