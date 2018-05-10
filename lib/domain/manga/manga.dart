import '../source/source.dart' show Source;
import 'manga_info.dart' show MangaInfo;
import 'manga_segment.dart' show MangaSegment;

class Manga {
  Source source;
  MangaInfo info;
  List<MangaSegment> segments;

  Manga({this.source, this.info, this.segments}) {}

  Manga setSource(Source source) => this..source = source;

  Manga setInfo(MangaInfo info) => this..info = info;

  Manga setSegments(List<MangaSegment> mangas) => this..segments = segments;

  Manga addSegments(List<MangaSegment> mangas) {
    if (this.segments == null) return setSegments(mangas);
    return this..segments.addAll(mangas);
  }

  Manga addSegment(MangaSegment segment) {
    if (this.segments == null) this.segments = new List<MangaSegment>();
    return this..segments.add(segment);
  }
}
