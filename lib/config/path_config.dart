import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'info_config.dart' show InfoConfig;
import '../parse/const/strategy.dart' show Strategy;
import '../parse/parse_element.dart' show ParseElement;

part 'path_config.g.dart';

@JsonSerializable(includeIfNull: false)
class PathConfig {
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final String path;
  @JsonKey(nullable: true)
  final String preloadPath;
  @JsonKey(nullable: true)
  final Strategy defaultStrategy;
  @JsonKey(nullable: true)
  final Strategy defaultPreloadStrategy;
  @JsonKey(nullable: true)
  final InfoConfig info;
  @JsonKey(nullable: false)
  final List<ParseElement> elements;

  PathConfig(this.name, this.path, this.preloadPath, this.defaultStrategy,
      this.defaultPreloadStrategy, this.info, this.elements);

  factory PathConfig.fromJson(Map<String, dynamic> json) =>
      _$PathConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PathConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
