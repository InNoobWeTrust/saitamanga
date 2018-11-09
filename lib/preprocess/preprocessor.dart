import 'dart:convert' show json;

import 'package:yaml/yaml.dart' show loadYaml;

import './helper/dom_creator.dart' show DomCreator;
import './const/preprocess_type.dart' show PreprocessType;

/// Do the preprocessing of raw [String] data into transformable data
class PreProcessor {
  /// Preprocess the [data] to the desired type before transforming
  static dynamic preprocess(
    String data,
    PreprocessType type,
    Map<String, dynamic> metadata,
  ) {
    switch (type) {
      case PreprocessType.xml:
        throw Exception('Unimplemented preprocess target!');
        break;
      case PreprocessType.json:
        return json.decode(data);
        break;
      case PreprocessType.yaml:
        return json.decode(
          json.encode(
            loadYaml(
              data,
              sourceUrl: metadata['base_url'],
            ),
          ),
        );
        break;
      case PreprocessType.dom:
        return DomCreator.fromJson(metadata).generateDOM(data);
        break;
      case PreprocessType.string:
      default:
        return data;
        break;
    }
  }
}
