import 'dart:async' show Stream;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'parser.dart' show Parser;
import 'const/role.dart' show Role;

part 'parser_group.g.dart';

@JsonSerializable()
class ParserGroup {
  @JsonKey(nullable: false)
  String name;
  @JsonKey(nullable: true)
  String icon;
  @JsonKey(nullable: false)
  List<Parser> parsers;

  ParserGroup({this.name, this.icon, this.parsers});

  factory ParserGroup.fromJson(Map<String, dynamic> json) =>
      _$ParserGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ParserGroupToJson(this);

  /// The type of [data] varies in different sources.
  /// Refer to [Parser.streamParse()] for more information
  ///
  /// Events emitted are lists which is:
  ///
  ///   - [Role] of parser as first element
  ///   - The parse [Stream] which events are [String]
  Stream<MapEntry<Role, Stream<String>>> parse(dynamic data) async* {
    assert(this.parsers != null && this.parsers.isNotEmpty);
    for (Parser parser in this.parsers) {
      yield new MapEntry(parser.role, parser.streamParse(data));
    }
  }

  @override
  String toString() {
    return parsers.toString();
  }
}
