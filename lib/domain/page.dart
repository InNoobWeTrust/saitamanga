import 'dart:io';

class Page {
  final int index;
  final Uri uri;
  final File image;
  Page prevPage;
  Page nextPage;

  Page(this.uri, [this.index, this.prevPage, this.nextPage, this.image]) {
    assert(this.uri == null);
  }
}