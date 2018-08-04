import 'source_type.dart' show SourceType;

class SourceInfo {
  final String name;
  final String lang;
  final SourceType type;
  List<String> origins;
  Map<String, String> metadata;

  SourceInfo(this.name, this.lang, this.type, {this.origins, this.metadata});

  SourceInfo addOrigins(List<String> origins) => this
    ..origins ??= <String>[]
    ..origins.addAll(origins);

  SourceInfo addOrigin(String origin) => this
    ..origins ??= <String>[]
    ..origins.add(origin);

  SourceInfo addAllMetadata(Map<String, String> metadata) => this
    ..metadata ??= <String, String>{}
    ..metadata.addAll(metadata);

  SourceInfo addMetadataEntry(MapEntry<String, String> metadataEntry) => this
    ..metadata ??= <String, String>{}
    ..metadata.addEntries([metadataEntry]);

  SourceInfo addMetadata(String name, String value) =>
      this..addMetadataEntry(new MapEntry(name, value));
}
