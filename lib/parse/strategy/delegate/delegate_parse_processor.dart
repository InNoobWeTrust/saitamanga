import 'dart:async' show Stream;

/// Implement this to do advanced type of parsing
abstract class DelegateParseProcessor {
  /// Use exclusive capability of current runtime to do the parse
  Stream<String> process(
    Stream<String> preprocessed, {
    Map<String, String> instructions,
  });
}
