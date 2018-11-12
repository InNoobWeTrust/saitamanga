// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
      (json['inputs'] as Map<String, dynamic>)
          ?.map((k, e) => MapEntry(k, e as String)),
      (json['radio'] as Map<String, dynamic>)
          ?.map((k, e) => MapEntry(k, e as String)),
      (json['checkbox'] as Map<String, dynamic>)
          ?.map((k, e) => MapEntry(k, (e as List)?.map((e) => e as String))));
}

Map<String, dynamic> _$QueryToJson(Query instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inputs', instance.inputs);
  writeNotNull('radio', instance.radio);
  writeNotNull(
      'checkbox', instance.checkbox?.map((k, e) => MapEntry(k, e?.toList())));
  return val;
}
