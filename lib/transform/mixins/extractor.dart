import 'dart:async' show Stream;

import '../../parse/parser_group.dart' show ParserGroup;
import '../../parse/const/role.dart' show Role;

abstract class Extractor {
  List<ParserGroup> parserGroups;

  /// Will throw exception if trying to preprocess [preprocessedData] failed
  Stream<MapEntry<String, Stream<MapEntry<Role, Stream<String>>>>> extract(
      dynamic preprocessedData) async* {
    assert(this.parserGroups != null && this.parserGroups.isNotEmpty);
    for (ParserGroup parserGroup in this.parserGroups) {
      yield new MapEntry<String, Stream<MapEntry<Role, Stream<String>>>>(
          parserGroup.name, parserGroup.parse(preprocessedData));
    }
  }
}
