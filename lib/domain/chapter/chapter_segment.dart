import '../page/page.dart' show Page;

class ChapterSegment {
  final Uri uri;
  int index;
  String id;
  List<Page> pages;

  ChapterSegment(this.uri, {this.index, this.id, this.pages});

  ChapterSegment setIndex(int index) => this..index = index;

  ChapterSegment setId(String id) => this..id = id;

  ChapterSegment setPages(List<Page> pages) => this..pages = pages;

  ChapterSegment addPages(List<Page> pages) {
    if (this.pages == null) return setPages(pages);
    return this..pages.addAll(pages);
  }

  ChapterSegment addPage(Page page) {
    if (this.pages == null) this.pages = new List<Page>();
    return this..pages.add(page);
  }
}
