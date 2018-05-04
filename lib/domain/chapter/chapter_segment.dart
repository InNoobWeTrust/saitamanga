import '../page/page.dart' show Page;

class ChapterSegment {
  final int index;
  final Uri uri;
  String id;
  List<Page> pages;

  ChapterSegment(this.index, this.uri, {this.id, this.pages}) {
    assert(this.index is int);
    assert(this.uri is Uri);
  }
}
