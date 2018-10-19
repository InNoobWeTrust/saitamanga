import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import '../parse/const/strategy.dart' show Strategy;
import '../parse/parse_element.dart' show ParseElement;
import 'info_config.dart' show InfoConfig;
import 'const/view.dart' show View;

part 'view_config.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ViewConfig {
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final View view;
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

  ViewConfig(
      this.name,
      this.view,
      this.path,
      this.preloadPath,
      this.defaultStrategy,
      this.defaultPreloadStrategy,
      this.info,
      this.elements);

  factory ViewConfig.fromJson(Map<String, dynamic> json) =>
      _$ViewConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ViewConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
