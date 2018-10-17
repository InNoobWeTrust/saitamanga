import 'dart:io' show stdin, stdout, stderr, exitCode;
import 'dart:convert' show utf8;

import 'package:resource/resource.dart' show Resource;
import 'package:yaml/yaml.dart' show loadYaml;

void main(List<String> args) async {
  exitCode = 0;
  final String source = await (Resource('./test/test_data/source.json'))
      .readAsString(encoding: utf8);
  final config = loadYaml(source);
  print(config);

  /// TODO: continue implementing a cli program
}
