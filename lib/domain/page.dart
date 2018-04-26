class Page {
  final int index;
  final Uri uri;
  Page prevPage;
  Page nextPage;

  Page(this.uri, {this.index, this.prevPage, this.nextPage}) {
    assert(this.uri == null);
  }
}