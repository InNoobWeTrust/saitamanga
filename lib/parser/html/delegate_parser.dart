
import 'dart:async';

import '../parser.dart' show Parser;

abstract class DelegateSelectParser extends Object implements Parser {
  String instruction;

  Future<String> delegateProcess(String data);

  Future<Iterable<String>> delegateProcessAll(String data) async {
    final String processed = await delegateProcess(data);
    return processed.split('\n');
  }

  @override
  Future<String> findIn(String data) async {
    return delegateProcess(data);
  }

  @override
  Future<Iterable<String>> findAllIn(String data) async {
    return delegateProcessAll(data);
  }
}
