import 'dart:convert' show json, utf8;

import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:resource/resource.dart';
import 'package:html/dom.dart' show Document;

import '../../../lib/domain/info/info_item.dart' show InfoItem;
import '../../../lib/parse/parser_group.dart' show ParserGroup;
import '../../../lib/preprocess/helper/dom_creator.dart' show DomCreator;
import '../../../lib/transform/transformer.dart' show Transformer;

void main() {
  test(
      "[Integration - config/load/mixins/parserloader.dart] "
      "Test parsing real data", () async {
    // First create the loader
    final String source = await (new Resource('./test/test_data/source.json'))
        .readAsString(encoding: utf8);
    final Map sourceMap = json.decode(source);
    final List groupConfigs =
        sourceMap["categories"][0]["parser_groups"] as List;
    expect(groupConfigs, isNotEmpty);
    final List<ParserGroup> groups = <ParserGroup>[];
    for (Map config in groupConfigs) {
      final ParserGroup group = ParserGroup.fromJson(config);
      groups.add(group);
      // print(group);
      expect(group, isNotNull);
    }
    // Then load data from the web
    final String uri =
        "http://hocvientruyentranh.com/manga/all?filter_type=latest-chapter";
    final Client client = new Client();
    final Response response = await client.get(uri);
    // print(response.body.substring(
    //     0, response.contentLength > 100 ? 100 : response.contentLength - 1));
    expect(response.contentLength, greaterThan(0));
    // Preprocess data
    final DomCreator domCreator = new DomCreator(
        baseUri: "http://hocvientruyentranh.com/manga/all",
        encoding: utf8.name);
    final Document dom = await domCreator.generateDOM(response.body);
    // print(dom.outerHtml.substring(0, 100));
    // Then transform the data
    final Transformer transformer = new Transformer(parserGroups: groups);
    await for (var item in transformer.transform(dom)) {
      final MapEntry entry = new MapEntry(item.key, await item.value);
      print("${entry}\n");
      expect(entry.value.runtimeType, InfoItem);
    }
  });
}
