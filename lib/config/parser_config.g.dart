// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParserConfig _$ParserConfigFromJson(Map<String, dynamic> json) {
  return ParserConfig(
      _$enumDecodeNullable(_$RoleEnumMap, json['role']),
      json['name'] as String,
      _$enumDecodeNullable(_$StrategyEnumMap, json['strategy']),
      Map<String, String>.from(json['instruction'] as Map));
}

Map<String, dynamic> _$ParserConfigToJson(ParserConfig instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('role', _$RoleEnumMap[instance.role]);
  writeNotNull('name', instance.name);
  writeNotNull('strategy', _$StrategyEnumMap[instance.strategy]);
  val['instruction'] = instance.instruction;
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

const _$RoleEnumMap = <Role, dynamic>{
  Role.primary: 'primary',
  Role.link: 'link',
  Role.meta: 'meta'
};

const _$StrategyEnumMap = <Strategy, dynamic>{
  Strategy.html__css_select: 'html__css_select',
  Strategy.html__delegate: 'html__delegate',
  Strategy.html__mixed__select_delegate: 'html__mixed__select_delegate'
};
