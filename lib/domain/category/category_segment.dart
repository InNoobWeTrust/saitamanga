import '../../parse/parse_product.dart' show ParseProduct;
import '../manga/manga.dart' show Manga;

class CategorySegment {
  final Uri uri;
  final List<Manga> _mangas = <Manga>[];
  List<Manga> get mangas => this._mangas;

  CategorySegment(this.uri, List<ParseProduct> elements) {
    _processMangas(elements);
  }

  void _processMangas(List<ParseProduct> elements) {
    _mangas.addAll(elements
        .firstWhere((e) => e.id == 'uri')
        .link
        .map((l) => Manga(this, l)));
  }
}
