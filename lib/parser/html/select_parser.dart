import 'dart:async' show Future;

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import '../parser_type.dart' show ParserType;
import 'mixins/dom_creator.dart' show DomCreator;
import 'mixins/selector.dart' show Selector;

class SelectParser extends Parser with DomCreator, Selector {
  @override
  ParserType type;
  @override
  Map<String, String> configs;
  @override
  final List<String> requiredConfigKeys = Selector.CONFIG_KEYS;
  @override
  String encoding;
  @override
  String baseUri;

  SelectParser(this.type,
      {this.configs, this.encoding = 'utf-8', this.baseUri});

  @override
  Future<Iterable<String>> findIn(String data) async {
    final Document dom = await generateDOM(data);
    if (type == ParserType.SINGLE)
      return new List<String>()..add(await select(dom));
    else
      return await selectAll(dom);
  }
}
