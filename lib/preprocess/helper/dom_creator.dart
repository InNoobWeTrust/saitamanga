import 'dart:convert' show JsonEncoder;

import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' show Document;
import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey, FieldRename;

part 'dom_creator.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class DomCreator {
  final String encoding;
  final String baseUri;

  DomCreator(this.baseUri, {this.encoding = 'utf-8'});

  factory DomCreator.fromJson(Map<String, dynamic> json) =>
      _$DomCreatorFromJson(json);

  Map<String, dynamic> toJson() => _$DomCreatorToJson(this);

  Document generateDOM(String html) {
    if (!(html is String) || html.isEmpty) return null;
    return parse(html, encoding: this.encoding, sourceUrl: this.baseUri);
  }

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
