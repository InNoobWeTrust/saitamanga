import 'dart:async';

abstract class Parser {
  String extractor;

  Future<String> findIn(String data,
      {String encoding = 'UTF-8', String baseUri});
  Future<Iterable<String>> findAllIn(String data,
      {String encoding = 'UTF-8', String baseUri});
}
