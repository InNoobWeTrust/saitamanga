import 'dart:convert' show JsonEncoder;

import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, FieldRename, JsonKey;

import '../preprocess/const/preprocess_type.dart' show PreprocessType;
import './const/strategy.dart' show Strategy;
import './parse_element_config.dart' show ParseElementConfig;
import './info_config.dart' show InfoConfig;
import './query_config.dart' show QueryConfig;
import './const/view.dart' show View;

part 'view_config.g.dart';

/// Represent the behaviour of the [View]
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
  @JsonKey(nullable: false)
  final Strategy defaultStrategy;
  @JsonKey(nullable: false)
  final PreprocessType defaultPreprocessType;
  @JsonKey(nullable: true)
  final InfoConfig info;
  @JsonKey(nullable: true)
  final List<QueryConfig> queryParams;
  @JsonKey(nullable: false)
  final List<ParseElementConfig> elements;

  ViewConfig(
      this.name,
      this.view,
      this.path,
      this.preloadPath,
      this.defaultStrategy,
      this.defaultPreprocessType,
      this.info,
      this.queryParams,
      this.elements);

  factory ViewConfig.fromJson(Map<String, dynamic> json) =>
      _$ViewConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ViewConfigToJson(this);

  @override
  String toString() => JsonEncoder.withIndent('  ').convert(this.toJson());
}
