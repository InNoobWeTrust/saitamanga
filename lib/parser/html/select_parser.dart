import 'dart:async';

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser, ParserType;
import 'mixins/dom_creator.dart' show DomCreator;
import 'mixins/selector.dart' show Selector;

class SelectParser extends Parser with DomCreator, Selector {
  @override
  ParserType type;
  @override
  String selector;
  @override
  String attribute;
  @override
  String encoding;
  @override
  String baseUri;

  SelectParser(this.type, this.selector, this.attribute,
      {this.encoding = 'utf-8', this.baseUri});

  @override
  Future<dynamic> findIn(String data) async {
    final Document dom = await generateDOM(data);
    if (type == ParserType.SINGLE)
      return await extract(dom);
    else
      return await extractAll(dom);
  }
}
