import 'dart:convert' show json, utf8;

import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:resource/resource.dart';
import 'package:yaml/yaml.dart';

void main() {
  // test("Test json reading", () async {
  //   final String source = await (Resource('./test/test_data/source.json'))
  //       .readAsString(encoding: utf8);
  //   final Map sourceMap = json.decode(source);
  //   print(sourceMap);
  //   expect(
  //     sourceMap,
  //     isNotEmpty,
  //   );
  // });
  test("Test yaml reading", () async {
    final String source = await (Resource(
      './test/test_data/source.yaml',
    ).readAsString(encoding: utf8));
    final YamlMap sourceMap = loadYaml(
      source,
    );
    print(sourceMap);
    expect(
      sourceMap,
      isNotEmpty,
    );
  });
  test("Test http request", () async {
    final String uri =
        "http://hocvientruyentranh.com/manga/all?filter_type=latest-chapter";
    final Client client = Client();
    final Response response = await client.get(
      uri,
    );
    print(response.body.substring(
        0, response.contentLength > 100 ? 100 : response.contentLength - 1));
    expect(
      response.contentLength,
      greaterThan(0),
    );
  });
}
