import 'dart:async';

import '../parser.dart' show Parser;

abstract class DelegateParser extends Parser {
  String instruction;

  Future<dynamic> delegateProcess(String data);

  @override
  Future<dynamic> findIn(String data) async => delegateProcess(data);
}
