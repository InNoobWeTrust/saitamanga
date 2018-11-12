// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parse_element_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParseElementConfig _$ParseElementConfigFromJson(Map<String, dynamic> json) {
  return ParseElementConfig(
      _$enumDecodeNullable(_$IdEnumMap, json['id']),
      json['name'] as String,
      json['target'] as String,
      _$enumDecodeNullable(_$PreprocessTypeEnumMap, json['preprocess_type']),
      _$enumDecode(_$AmountEnumMap, json['amount']),
      json['icon'] as String,
      (json['parsers'] as List)
          .map((e) => ParserConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      sort: _$enumDecodeNullable(_$SortEnumMap, json['sort']));
}

Map<String, dynamic> _$ParseElementConfigToJson(ParseElementConfig instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$IdEnumMap[instance.id]);
  writeNotNull('name', instance.name);
  writeNotNull('target', instance.target);
  writeNotNull(
      'preprocess_type', _$PreprocessTypeEnumMap[instance.preprocessType]);
  val['amount'] = _$AmountEnumMap[instance.amount];
  writeNotNull('sort', _$SortEnumMap[instance.sort]);
  writeNotNull('icon', instance.icon);
  val['parsers'] = instance.parserConfigs;
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

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$IdEnumMap = <Id, dynamic>{
  Id.category: 'category',
  Id.category__title: 'category__title',
  Id.category__cover: 'category__cover',
  Id.category__description: 'category__description',
  Id.album: 'album',
  Id.album__title: 'album__title',
  Id.album__cover: 'album__cover',
  Id.album__description: 'album__description',
  Id.collage: 'collage',
  Id.collage__title: 'collage__title',
  Id.collage__cover: 'collage__cover',
  Id.collage__desscription: 'collage__desscription',
  Id.collage__picture: 'collage__picture',
  Id.pagination: 'pagination',
  Id.prev: 'prev',
  Id.next: 'next'
};

const _$PreprocessTypeEnumMap = <PreprocessType, dynamic>{
  PreprocessType.string: 'string',
  PreprocessType.xml: 'xml',
  PreprocessType.dom: 'dom',
  PreprocessType.json: 'json',
  PreprocessType.yaml: 'yaml'
};

const _$AmountEnumMap = <Amount, dynamic>{
  Amount.single: 'single',
  Amount.multiple: 'multiple'
};

const _$SortEnumMap = <Sort, dynamic>{Sort.asc: 'asc', Sort.desc: 'desc'};
