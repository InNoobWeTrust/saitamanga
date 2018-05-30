import '../source/source.dart' show Source;
import 'manga_segment.dart' show MangaSegment;

class Manga {
  Source source;
  Map<String, Map<String, Iterable<String>>> info;
  List<MangaSegment> segments;

  Manga({this.source, this.info, this.segments});

  Manga setSource(Source source) => this..source = source;

  Manga setInfo(Map<String, Map<String, Iterable<String>>> info) =>
      this..info = info;

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
