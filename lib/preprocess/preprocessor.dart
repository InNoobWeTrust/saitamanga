import 'dart:async' show FutureOr;

import '../domain/source/source.dart' show Source;
import '../domain/source/source_type.dart' show SourceType;
import 'helper/dom_creator.dart' show DomCreator;

class PreProcessor {
  Source source;

  /// Preprocess the [data] to the desired type before transforming
  ///
  /// Remember to enable strong mode when running the program to
  /// spot any misuse of the return value (due to the nature of
  /// [FutureOr], when run in non-strong mode, it is interpreted
  /// as [dynamic], which is the intended type wrapped by it)
  FutureOr<dynamic> preprocess(String data, {String baseUri}) async {
    switch (source.info.type) {
      case SourceType.HTML:
        String encoding = source.info.metaData['encoding'];
        DomCreator domCreator = encoding == null
            ? DomCreator(baseUri: baseUri)
            : DomCreator(encoding: encoding, baseUri: baseUri);
        return domCreator.generateDOM(data);
        break;
      default:
        return data;
        break;
    }
  }
}
