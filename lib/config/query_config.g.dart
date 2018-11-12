// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryConfig _$QueryConfigFromJson(Map<String, dynamic> json) {
  return QueryConfig(
      json['name'] as String,
      json['display_name'] as String,
      _$enumDecode(_$InputTypeEnumMap, json['input']),
      json['preload'] == null
          ? null
          : ParseElementConfig.fromJson(
              json['preload'] as Map<String, dynamic>),
      (json['options'] as List)?.map((e) => e as String)?.toList(),
      (json['default'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$QueryConfigToJson(QueryConfig instance) {
  var val = <String, dynamic>{
    'name': instance.name,
    'display_name': instance.displayName,
    'input': _$InputTypeEnumMap[instance.input],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('preload', instance.preload);
  writeNotNull('options', instance.options);
  writeNotNull('default', instance.defaultValue);
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

const _$InputTypeEnumMap = <InputType, dynamic>{
  InputType.text: 'text',
  InputType.number: 'number',
  InputType.radio: 'radio',
  InputType.checkbox: 'checkbox'
};
