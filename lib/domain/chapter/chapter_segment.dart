import '../page/page.dart' show Page;
import '../../parse/parse_product.dart' show ParseProduct;

class ChapterSegment {
  final Uri uri;
  final List<Page> _pages = <Page>[];
  List<Page> get pages => this._pages;

  ChapterSegment(this.uri, List<ParseProduct> elements) {
    _processPages(elements);
  }

  void _processPages(List<ParseProduct> elements) {
    _pages.addAll(elements
        .firstWhere((e) => e.id == 'uri')
        .link
        .map((l) => Page(this, l)));
  }
}
