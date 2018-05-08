import 'dart:async';

abstract class Parser {
  String extractor;

  Future<String> findIn(String data);
  Future<Iterable<String>> findAllIn(String data);
}
