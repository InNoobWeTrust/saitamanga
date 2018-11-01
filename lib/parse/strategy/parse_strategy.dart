import 'dart:async' show Stream;

/// The strategy to use to parse data
abstract class ParseStrategy {
  /// The type of [data] varies in different sources
  ///
  ///   - [Document]      for HTML sources
  ///   - [String]        for other sources
  Stream<String> streamParse(dynamic data);
}
