import '../page/page.dart' show Page;

class ChapterSegment {
  final Uri uri;
  List<Page> pages;

  ChapterSegment(this.uri, {this.pages});

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
