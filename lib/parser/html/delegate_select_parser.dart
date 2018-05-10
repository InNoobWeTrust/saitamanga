import 'dart:async';

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import 'mixins/dom_creator.dart' show DomCreator;
import 'mixins/selector.dart' show Selector;

abstract class DelegateSelectParser extends Object
    with DomCreator, Selector
    implements Parser {
  String instruction;

  Future<String> _extractData(String data) async {
    final Document dom = await generateDOM(data);
    final String extracted = await extract(dom);
    return extracted;
  }

  Future<String> delegatePostProcess(String extracted);

  Future<Iterable<String>> delegatePostProcessAll(String extracted) async {
    final String processed = await delegatePostProcess(extracted);
    return processed.split('\n');
  }

  @override
  Future<String> findIn(String data) async {
    final extracted = await _extractData(data);
    return delegatePostProcess(extracted);
  }

  @override
  Future<Iterable<String>> findAllIn(String data) async {
    final extracted = await _extractData(data);
    return delegatePostProcessAll(extracted);
  }
}
