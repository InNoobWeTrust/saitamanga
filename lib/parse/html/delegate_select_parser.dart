import 'dart:async' show Stream;

import 'package:html/dom.dart' show Document;

import '../parser.dart' show Parser;
import '../parse_type.dart' show ParseType;
import '../delegate_parse_processor.dart' show DelegateParseProcessor;
import 'mixins/selector.dart' show Selector;

class DelegateSelectParser extends Parser with Selector {
  @override
  ParseType parseType;
  @override
  Map<String, String> configs;
  @override
  static List<String> requiredConfigKeys = Selector.CONFIG_KEYS;
  DelegateParseProcessor processor;

  DelegateSelectParser(this.parseType, {this.configs, this.processor});

  DelegateSelectParser setProcessor(DelegateParseProcessor processor) =>
      this..processor = processor;

  /// The type of [data] here is [Document]
  ///
  /// Note: Will return null if the [processor] of this object is null
  @override
  Stream<String> findIn(dynamic data) {
    final Stream<String> selected = select(data as Document);
    return processor?.process(selected);
  }
}
