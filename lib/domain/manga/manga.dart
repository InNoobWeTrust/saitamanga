import '../source/source.dart' show Source;
import 'manga_info.dart' show MangaInfo;
import 'manga_segment.dart' show MangaSegment;

class Manga {
  final Source source;
  MangaInfo info;
  List<MangaSegment> segments;

  Manga(this.source, {this.info, this.segments}) {
    assert(this.source is Source);
  }
}
