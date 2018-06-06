import 'dart:async' show Future;

abstract class DelegateParseProcessor {
  Future<Iterable<String>> process(String preprocessed,
      {Map<String, String> configs});
}
