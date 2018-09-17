import '../../parse/parse_product.dart' show ParseProduct;
import '../source/source.dart' show Source;
import 'manga_segment.dart' show MangaSegment;

class Manga {
  Source source;
  List<ParseProduct> elements = <ParseProduct>[];
  List<MangaSegment> segments = <MangaSegment>[];

  Manga({this.source, this.elements, this.segments});

  Manga addElements(List<ParseProduct> elements) => this
    ..elements ??= <ParseProduct>[]
    ..elements.addAll(elements);

  Manga addElement(ParseProduct element) => this
  ..elements ??= <ParseProduct>[]
    ..elements.add(element);

  Manga addSegments(List<MangaSegment> mangas) => this
    ..segments ??= <MangaSegment>[]
    ..segments.addAll(segments);

  Manga addSegment(MangaSegment segment) => this
    ..segments ??= <MangaSegment>[]
    ..segments.add(segment);
}
