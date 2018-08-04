import 'dart:convert' show json, utf8;

import 'package:test/test.dart';
import 'package:resource/resource.dart';

import '../../../lib/parse/parser_group.dart' show ParserGroup;
import '../../../lib/config/load/mixins/parser_loader.dart' show ParserLoader;

class ParserLoaderImpl extends ParserLoader {
  ParserLoaderImpl();
}

void main() {
  test(
      "[Unit - config/load/mixins/parserloader.dart] "
      "Test loading parsers", () async {
    final String source = await (new Resource('./test/test_data/source.json'))
        .readAsString(encoding: utf8);
    final Map sourceMap = json.decode(source);
    final Iterable<MapEntry> parserGroups =
        (sourceMap["categories"][0]["parsers"] as Map).entries;
    // print(parsers);
    expect(parserGroups, isNotEmpty);
    final loader = new ParserLoaderImpl();
    for (MapEntry groupConfig in parserGroups) {
      final ParserGroup group = loader.loadParserGroup(groupConfig.value);
      print("${groupConfig.key}: ${group}");
      expect(group, isNotNull);
    }
  });
}
