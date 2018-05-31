import '../manga/manga.dart' show Manga;
import 'chapter_segment.dart' show ChapterSegment;

import '../info/info_item.dart' show InfoItem;

class Chapter {
  Manga manga;
  Map<String, InfoItem> info;
  List<ChapterSegment> segments;

  Chapter({this.manga, this.info, this.segments});

  Chapter setManga(Manga manga) => this..manga = manga;

  Chapter setInfo(Map<String, InfoItem> info) => this..info = info;

  Chapter setSegments(List<ChapterSegment> segments) =>
      this..segments = segments;

  Chapter addSegments(List<ChapterSegment> segments) {
    if (this.segments == null) return setSegments(segments);
    return this..segments.addAll(segments);
  }

  Chapter addSegment(ChapterSegment segment) {
    if (this.segments == null) this.segments = new List<ChapterSegment>();
    return this..segments.add(segment);
  }
}
