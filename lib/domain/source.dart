class Source {
  final String name;
  final String lang;
  List<String> origins;

  Source(this.name, this.lang) {
    assert(this.name is String && this.name.isNotEmpty);
    assert(this.lang is String && this.lang.isNotEmpty);
  }
}
