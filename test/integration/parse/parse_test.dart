import 'dart:convert' show json, utf8;

import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:resource/resource.dart' show Resource;
import 'package:yaml/yaml.dart' show loadYaml;

import '../../../lib/config/view_config.dart' show ViewConfig;
import '../../../lib/transform/transformer.dart' show Transformer;

void main() {
  test(
      "[Integration - parse/parse_element.dart] "
      "Test parsing real data", () async {
    // First load the path's config
    final String source = await (Resource(
      './test/test_data/source.yaml',
    ))
        .readAsString(encoding: utf8);
    final Map sourceMap = json.decode(
      json.encode(
        loadYaml(
          source,
        ),
      ),
    );
    final ViewConfig config =
        ViewConfig.fromJson(sourceMap["views"]["manga list"]);
    // Then load data from the web
    final String uri =
        "http://hocvientruyentranh.net/manga/all?filter_type=latest-chapter";
    final Client client = Client();
    final Response response = await client.get(
      uri,
    );
    expect(
      response.contentLength,
      greaterThan(0),
    );
    final Transformer transformer = Transformer(config, null);
    await for (var item in await transformer
        .transform(response.body, {'base_url': response.request.url})) {
      print("${item}\n");
    }
  });
}
