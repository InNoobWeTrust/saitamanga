import 'dart:async' show Future;

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import '../parser_type.dart' show ParserType;
import 'mixins/selector.dart' show Selector;

class SelectParser extends Parser with Selector {
  @override
  ParserType type;
  @override
  Map<String, String> configs;
  @override
  final List<String> requiredConfigKeys = Selector.CONFIG_KEYS;

  SelectParser(this.type, {this.configs});

  /// The type of [data] here is [Document]
  @override
  Future<Iterable<String>> findIn(dynamic data) async {
    if (type == ParserType.SINGLE)
      return new List<String>()..add(await select(data as Document));
    else
      return await selectAll(data as Document);
  }
}
