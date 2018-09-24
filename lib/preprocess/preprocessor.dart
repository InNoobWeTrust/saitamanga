import 'dart:async' show Future;

import '../domain/source/source.dart' show Source;
import '../domain/source/source_type.dart' show SourceType;
import 'helper/dom_creator.dart' show DomCreator;

class PreProcessor {
  Source source;

  /// Preprocess the [data] to the desired type before transforming
  Future<dynamic> preprocess(String data, {String baseUri}) async {
    if (source.info?.metadata == null)
      throw Exception("Source info not set properly!");
    switch (source.info.type) {
      case SourceType.HTML:
        String encoding = source.info.metadata["encoding"];
        DomCreator domCreator = encoding == null
            ? DomCreator(baseUri)
            : DomCreator(baseUri, encoding: encoding);
        return await domCreator.generateDOM(data);
        break;
      default:
        return data;
        break;
    }
  }
}
