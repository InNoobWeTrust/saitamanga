import 'dart:async' show Future;

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import 'mixins/selector.dart' show Selector;

abstract class DelegateSelectParser extends Parser with Selector {
  Future<Iterable<String>> delegateProcess(String preprocessed);

  /// The type of [data] here is [Document]
  @override
  Future<Iterable<String>> findIn(dynamic data) async {
    final preprocessed = await select(data as Document);
    return delegateProcess(preprocessed);
  }
}
