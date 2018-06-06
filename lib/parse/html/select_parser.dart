import 'dart:async' show Future;

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import '../parse_type.dart' show ParseType;
import 'mixins/selector.dart' show Selector;

class SelectParser extends Parser with Selector {
  @override
  ParseType parseType;
  @override
  Map<String, String> configs;
  @override
  final List<String> requiredConfigKeys = Selector.CONFIG_KEYS;

  SelectParser(this.parseType, {this.configs});

  /// The type of [data] here is [Document]
  @override
  Future<Iterable<String>> findIn(dynamic data) async {
    if (parseType == ParseType.SINGLE)
      return new List<String>()..add(await select(data as Document));
    else
      return await selectAll(data as Document);
  }
}
