// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dom_creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomCreator _$DomCreatorFromJson(Map<String, dynamic> json) {
  return DomCreator(
      json['base_uri'] as String ?? 'utf-8', json['encoding'] as String);
}

Map<String, dynamic> _$DomCreatorToJson(DomCreator instance) {
  var val = <String, dynamic>{
    'encoding': instance.encoding,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('base_uri', instance.baseUri);
  return val;
}
