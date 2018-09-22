import 'dart:async';
import 'dart:convert' show json, utf8;

import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:resource/resource.dart';
import 'package:html/dom.dart' show Document;

import '../../../lib/parse/parse_element.dart' show ParseElement;
import '../../../lib/preprocess/helper/dom_creator.dart' show DomCreator;
import '../../../lib/parse/strategy/delegate_parse_processor.dart'
    show DelegateParseProcessor;
import '../../../lib/parse/strategy/parser_strategy_generator.dart'
    show ParserStrategyGenerator;
import '../../../lib/transform/transformer.dart' show Transformer;

class ProcessorImpl implements DelegateParseProcessor {
  @override
  Stream<String> process(Stream<String> preprocessed,
      {Map<String, String> instructions}) {
    UnimplementedError("This should never be called on this test");
    return null;
  }
}

void main() {
  test(
      "[Integration - parse/parse_element.dart] "
      "Test parsing real data", () async {
    // First create the loader
    final String source = await (new Resource('./test/test_data/source.json'))
        .readAsString(encoding: utf8);
    final Map sourceMap = json.decode(source);
    final List elementConfigs = sourceMap["categories"][0]["elements"] as List;
    final List<ParseElement> elements = <ParseElement>[];
    for (Map config in elementConfigs) {
      final ParseElement element = ParseElement.fromJson(config);
      expect(element, isNotNull);
      elements.add(element);
    }
    // Then load data from the web
    final String uri =
        "http://hocvientruyentranh.net/manga/all?filter_type=latest-chapter";
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
    final ProcessorImpl processor = new ProcessorImpl();
    final ParserStrategyGenerator strategyGenerator =
        ParserStrategyGenerator(processor: processor);
    final Transformer transformer = new Transformer(
        parseElements: elements, strategyGenerator: strategyGenerator);
    await for (var item in await transformer.transform(dom)) {
      print("${item}\n");
    }
  });
}
