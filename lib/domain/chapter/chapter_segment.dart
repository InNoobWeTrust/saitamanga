import '../page/page.dart' show Page;

class ChapterSegment {
  final Uri uri;
  List<Page> pages = <Page>[];

  ChapterSegment(this.uri, {this.pages});

  ChapterSegment addPages(List<Page> pages) => this
    ..pages ??= <Page>[]
    ..pages.addAll(pages);

  ChapterSegment addPage(Page page) => this
    ..pages ??= <Page>[]
    ..pages.add(page);
}
