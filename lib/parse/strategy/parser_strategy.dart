import 'dart:async' show Stream;

abstract class ParserStrategy {
  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources'
  ///   - [String]        for other sources
  Stream<String> streamParse(dynamic data);
}
