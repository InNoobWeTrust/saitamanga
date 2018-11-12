// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewConfig _$ViewConfigFromJson(Map<String, dynamic> json) {
  return ViewConfig(
      json['name'] as String,
      _$enumDecode(_$ViewEnumMap, json['view']),
      json['path'] as String,
      json['preload_path'] as String,
      _$enumDecode(_$StrategyEnumMap, json['default_strategy']),
      _$enumDecode(_$PreprocessTypeEnumMap, json['default_preprocess_type']),
      json['info'] == null
          ? null
          : InfoConfig.fromJson(json['info'] as Map<String, dynamic>),
      (json['query_params'] as List)
          ?.map((e) => e == null
              ? null
              : QueryConfig.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['elements'] as List)
          .map((e) => ParseElementConfig.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$ViewConfigToJson(ViewConfig instance) {
  var val = <String, dynamic>{
    'name': instance.name,
    'view': _$ViewEnumMap[instance.view],
    'path': instance.path,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('preload_path', instance.preloadPath);
  val['default_strategy'] = _$StrategyEnumMap[instance.defaultStrategy];
  val['default_preprocess_type'] =
      _$PreprocessTypeEnumMap[instance.defaultPreprocessType];
  writeNotNull('info', instance.info);
  writeNotNull('query_params', instance.queryParams);
  val['elements'] = instance.elements;
  return val;
}

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$ViewEnumMap = <View, dynamic>{
  View.category: 'category',
  View.album: 'album',
  View.collage: 'collage'
};

const _$StrategyEnumMap = <Strategy, dynamic>{
  Strategy.html__css_select: 'html__css_select',
  Strategy.html__delegate: 'html__delegate',
  Strategy.html__mixed__select_delegate: 'html__mixed__select_delegate'
};

const _$PreprocessTypeEnumMap = <PreprocessType, dynamic>{
  PreprocessType.string: 'string',
  PreprocessType.xml: 'xml',
  PreprocessType.dom: 'dom',
  PreprocessType.json: 'json',
  PreprocessType.yaml: 'yaml'
};
