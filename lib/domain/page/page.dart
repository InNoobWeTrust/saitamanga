class Page {
  final int index;
  final Uri uri;

  Page(this.index, this.uri) {
    assert(this.index is int);
    assert(this.uri is Uri);
  }
}