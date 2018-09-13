import 'dart:async' show Stream;

abstract class DelegateParseProcessor {
  Stream<String> process(Stream<String> preprocessed,
      {Map<String, String> instructions});
}
