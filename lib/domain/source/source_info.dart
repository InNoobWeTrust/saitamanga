import 'source_type.dart' show SourceType;

class SourceInfo {
  final String name;
  final String lang;
  final SourceType type;
  List<String> origins;
  Map<String, String> metaData;

  SourceInfo(this.name, this.lang, this.type, {this.origins, this.metaData});

  SourceInfo setOrigins(List<String> origins) => this..origins = origins;

  SourceInfo addOrigins(List<String> origins) {
    if (this.origins == null) return setOrigins(origins);
    return this..origins.addAll(origins);
  }

  SourceInfo addOrigin(String origin) {
    if (this.origins == null) this.origins = new List<String>();
    return this..origins.add(origin);
  }

  SourceInfo setMetaData(Map<String, String> metaData) =>
      this..metaData = metaData;
}
