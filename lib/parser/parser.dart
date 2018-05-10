import 'dart:async';

abstract class Parser {
  Future<String> findIn(String data);
  Future<Iterable<String>> findAllIn(String data);
}
