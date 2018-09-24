import '../chapter/chapter.dart' show Chapter;
import '../../parse/parse_product.dart' show ParseProduct;

class MangaSegment {
  final Uri uri;
  final List<Chapter> _chapters = <Chapter>[];
  List<Chapter> get chapters => this._chapters;

  MangaSegment(this.uri, List<ParseProduct> elements) {
    _processChapters(elements);
  }

  void _processChapters(List<ParseProduct> elements) {
    _chapters.addAll(elements
        .firstWhere((e) => e.id == 'uri')
        .link
        .map((l) => Chapter(this, l)));
  }
}
