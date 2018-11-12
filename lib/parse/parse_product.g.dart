// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parse_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParseProduct _$ParseProductFromJson(Map<String, dynamic> json) {
  return ParseProduct(
      _$enumDecodeNullable(_$IdEnumMap, json['id']),
      json['name'] as String,
      json['target'] as String,
      json['icon'] as String,
      (json['primary'] as List)?.map((e) => e as String)?.toList(),
      (json['link'] as List)
          ?.map((e) => e == null ? null : Uri.parse(e as String))
          ?.toList(),
      (json['metadata'] as Map<String, dynamic>)?.map((k, e) =>
          MapEntry(k, (e as List)?.map((e) => e as String)?.toList())));
}

Map<String, dynamic> _$ParseProductToJson(ParseProduct instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$IdEnumMap[instance.id]);
  writeNotNull('name', instance.name);
  writeNotNull('target', instance.target);
  writeNotNull('icon', instance.icon);
  writeNotNull('primary', instance.primary);
  writeNotNull('link', instance.link?.map((e) => e?.toString())?.toList());
  writeNotNull('metadata', instance.metadata);
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
