import '../category/category_segment.dart' show CategorySegment;
import 'manga_segment.dart' show MangaSegment;

/// TODO: Add MangaInfo class
class Manga {
  final CategorySegment categorySegment;
  final Uri initUri;
  final List<MangaSegment> segments = <MangaSegment>[];

  Manga(this.categorySegment, this.initUri);
}
