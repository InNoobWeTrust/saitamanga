import '../../parse/parse_product.dart' show ParseProduct;
import '../manga/manga.dart' show Manga;
import 'chapter_segment.dart' show ChapterSegment;

class Chapter {
  Manga manga;
  List<ParseProduct> elements = <ParseProduct>[];
  List<ChapterSegment> segments = <ChapterSegment>[];

  Chapter({this.manga, this.elements, this.segments});

  Chapter setManga(Manga manga) => this..manga = manga;

  Chapter setElements(List<ParseProduct> elements) => this..elements = elements;

  Chapter addSegments(List<ChapterSegment> segments) => this
    ..segments ??= <ChapterSegment>[]
    ..segments.addAll(segments);

  Chapter addSegment(ChapterSegment segment) => this
    ..segments ??= <ChapterSegment>[]
    ..segments.add(segment);
}
