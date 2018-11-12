// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
      json['request'] == null
          ? null
          : Request.fromJson(json['request'] as Map<String, dynamic>),
      headers: (json['headers'] as Map<String, dynamic>)
          ?.map((k, e) => MapEntry(k, e as String)),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ResponseToJson(Response instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('request', instance.request);
  writeNotNull('headers', instance.headers);
  writeNotNull('metadata', instance.metadata);
  return val;
}
