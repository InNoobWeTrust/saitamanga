import 'dart:async';
import 'dart:convert' show json, utf8;

import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:resource/resource.dart' show Resource;
import 'package:html/dom.dart' show Document;
import 'package:yaml/yaml.dart' show loadYaml;

import '../../../lib/config/path_config.dart' show PathConfig;
import '../../../lib/preprocess/helper/dom_creator.dart' show DomCreator;
import '../../../lib/parse/strategy/delegate_parse_processor.dart'
    show DelegateParseProcessor;
import '../../../lib/parse/strategy/parse_strategist.dart' show ParseStrategist;
import '../../../lib/transform/transformer.dart' show Transformer;

class FakeProcessor implements DelegateParseProcessor {
  @override
  Stream<String> process(Stream<String> preprocessed,
      {Map<String, String> instructions}) {
    UnimplementedError("This should never be called on this test! 😱");
    return null;
  }
}

void main() {
  test(
      "[Integration - parse/parse_element.dart] "
      "Test parsing real data", () async {
    // First load the path's config
    final String source = await (Resource('./test/test_data/source.yaml'))
        .readAsString(encoding: utf8);
    // final Map sourceMap = json.decode(source);
    final Map sourceMap = json.decode(json.encode(loadYaml(source)));
    final PathConfig config = PathConfig.fromJson(sourceMap["categories"][0]);
    // Then load data from the web
    final String uri =
        "http://hocvientruyentranh.net/manga/all?filter_type=latest-chapter";
    final Client client = Client();
    final Response response = await client.get(uri);
    // print(response.body.substring(
    //     0, response.contentLength > 100 ? 100 : response.contentLength - 1));
    expect(response.contentLength, greaterThan(0));
    // Preprocess data
    final DomCreator domCreator = DomCreator(
        "http://hocvientruyentranh.com/manga/all",
        encoding: utf8.name);
    final Document dom = await domCreator.generateDOM(response.body);
    // print(dom.outerHtml.substring(0, 100));
    // Then transform the data
    final FakeProcessor processor = FakeProcessor();
    final ParseStrategist strategist =
        ParseStrategist(processor, config.defaultStrategy);
    final Transformer transformer = Transformer(config.elements, strategist);
    await for (var item in await transformer.transform(dom)) {
      print("${item}\n");
    }
  });
}
