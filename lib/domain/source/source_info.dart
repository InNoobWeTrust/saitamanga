class SourceInfo {
  final String name;
  final String lang;
  List<String> origins;
  bool hasCookies;

  SourceInfo(this.name, this.lang, {this.origins, this.hasCookies});

  SourceInfo setOrigins(List<String> origins) => this..origins = origins;

  SourceInfo addOrigins(List<String> origins) {
    if (this.origins == null) return setOrigins(origins);
    return this..origins.addAll(origins);
  }

  SourceInfo addOrigin(String origin) {
    if (this.origins == null) this.origins = new List<String>();
    return this..origins.add(origin);
  }

  SourceInfo setHasCookies(bool hasCookies) => this..hasCookies = hasCookies;
}
