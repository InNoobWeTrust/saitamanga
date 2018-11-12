// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request(
      json['raw_link'] == null ? null : Uri.parse(json['raw_link'] as String),
      headers: (json['headers'] as Map<String, dynamic>)
          ?.map((k, e) => MapEntry(k, e as String)),
      query: json['query'] == null
          ? null
          : Query.fromJson(json['query'] as Map<String, dynamic>),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RequestToJson(Request instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('raw_link', instance.rawLink?.toString());
  writeNotNull('headers', instance.headers);
  writeNotNull('query', instance.query);
  writeNotNull('metadata', instance.metadata);
  return val;
}
