import 'dart:async';

import 'package:html/dom.dart' show Document;

import 'delegate_parser.dart' show DelegateParser;
import 'mixins/dom_creator.dart' show DomCreator;
import 'mixins/selector.dart' show Selector;

abstract class DelegateSelectParser extends DelegateParser
    with DomCreator, Selector {
  Future<String> _preprocessData(String data) async {
    final Document dom = await generateDOM(data);
    return await extract(dom);
  }

  @override
  Future<dynamic> findIn(String data) async {
    final preprocessed = await _preprocessData(data);
    return delegateProcess(preprocessed);
  }
}
