class SourceInfo {
  final String name;
  final String lang;
  List<String> origins;
  bool cookies;

  SourceInfo(this.name, this.lang, {this.origins, this.cookies}) {
    assert(this.name is String && this.name.isNotEmpty);
    assert(this.lang is String && this.lang.isNotEmpty);
  }
}
