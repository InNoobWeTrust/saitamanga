import 'dart:async' show Future, Stream;

import '../parse/parser_group.dart' show ParserGroup;
import '../domain/info/info_item.dart' show InfoItem;
import 'mixins/extractor.dart' show Extractor;
import 'mixins/converter.dart' show Converter;

class Transformer extends Object with Extractor, Converter {
  @override
  Map<String, ParserGroup> parserGroups;

  Transformer({this.parserGroups});

  Transformer setParserGroups(Map<String, ParserGroup> parserGroups) =>
      this..parserGroups = parserGroups;

  /// Remember to preprocess the data with [PreProcessor]
  /// before feeding into this
  Stream<MapEntry<String, Future<InfoItem>>> transform(
          dynamic preprocessedData) =>
      extract(preprocessedData).asyncMap<MapEntry<String, Future<InfoItem>>>(
          (entry) => new MapEntry(entry.key, convertEntry(entry.value)));
}
