import '../category/category_segment.dart' show CategorySegment;
import 'manga_segment.dart' show MangaSegment;
import '../info/info.dart' show Info;

class Manga {
  final CategorySegment categorySegment;
  final Uri initUri;
  Info info;
  final List<MangaSegment> segments = <MangaSegment>[];

  Manga(this.categorySegment, this.initUri, {this.info});
}
