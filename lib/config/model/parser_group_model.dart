import "package:json_annotation/json_annotation.dart" show JsonSerializable;

part "parser_group_model.g.dart";

@JsonSerializable()
class ParserGroupModel extends Object with _$ParserGroupModelSerializerMixin {
  final String codename;
  final String name;
  final String icon;
  final List<Map<String, dynamic>> conf;

  ParserGroupModel(
      {this.codename = null,
      this.name = null,
      this.icon = null,
      this.conf = const <Map<String, dynamic>>[]});

  factory ParserGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ParserGroupModelFromJson(json);
}
