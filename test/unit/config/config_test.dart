import 'dart:convert' show json, utf8;

import 'package:test/test.dart';
import 'package:resource/resource.dart';

import '../../../lib/parse/parser_group.dart' show ParserGroup;

void main() {
  test(
      "[Unit - config/load/mixins/parserloader.dart] "
      "Test loading parsers", () async {
    final String source = await (new Resource('./test/test_data/source.json'))
        .readAsString(encoding: utf8);
    final Map sourceMap = json.decode(source);
    final List parserGroups =
        sourceMap["categories"][0]["parser_groups"] as List;
    // print(parsers);
    expect(parserGroups, isNotEmpty);
    for (Map parserGroup in parserGroups) {
      final ParserGroup group = ParserGroup.fromJson(parserGroup);
      print("${parserGroup}: ${group}");
      expect(group, isNotNull);
    }
  });
}
