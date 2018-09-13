import 'dart:async' show Stream;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'parser.dart' show Parser;

part 'parser_group.g.dart';

@JsonSerializable()
class ParserGroup {
  @JsonKey(nullable: true)
  String codename;
  @JsonKey(nullable: false)
  String name;
  @JsonKey(nullable: true)
  String icon;
  @JsonKey(nullable: false)
  Map<String, Parser> parsers;

  ParserGroup({this.codename, this.name, this.icon, this.parsers});

  factory ParserGroup.fromJson(Map<String, dynamic> json) =>
      _$ParserGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ParserGroupToJson(this);

  /// The type of [data] varies in different sources
  ///
  /// Refer to [Parser.findIn()] for more information
  Stream<MapEntry<String, Stream<String>>> parse(dynamic data) async* {
    assert(this.parsers != null && this.parsers.isNotEmpty);
    for (MapEntry<String, Parser> entry in this.parsers.entries) {
      yield new MapEntry<String, Stream<String>>(
          entry.key, entry.value.streamParse(data));
    }
  }

  @override
  String toString() {
    return parsers.toString();
  }
}
