import 'dart:async' show Stream;

import '../../parse/parser_group.dart' show ParserGroup;

abstract class Extractor {
  Map<String, ParserGroup> parserGroups;

  /// Will throw exception if trying to preprocess [preprocessedData] failed
  Stream<MapEntry<String, Stream<MapEntry<String, Stream<String>>>>> extract(
      dynamic preprocessedData) async* {
    assert(this.parserGroups != null && this.parserGroups.isNotEmpty);
    for (MapEntry<String, ParserGroup> entry in this.parserGroups.entries) {
      yield new MapEntry<String, Stream<MapEntry<String, Stream<String>>>>(
          entry.key, entry.value.parse(preprocessedData));
    }
  }
}
