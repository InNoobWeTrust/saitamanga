import 'dart:async' show Future;

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import 'mixins/dom_creator.dart' show DomCreator;
import 'mixins/selector.dart' show Selector;

abstract class DelegateSelectParser extends Parser with DomCreator, Selector {
  Future<String> _preprocessData(String data) async {
    final Document dom = await generateDOM(data);
    return await select(dom);
  }

  Future<Iterable<String>> delegateProcess(String preprocessed);

  @override
  Future<Iterable<String>> findIn(String data) async {
    final preprocessed = await _preprocessData(data);
    return delegateProcess(preprocessed);
  }
}
