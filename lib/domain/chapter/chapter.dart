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

  Chapter addSegments(List<ChapterSegment> segments) => this
    ..segments ??= <ChapterSegment>[]
    ..segments.addAll(segments);

  Chapter addSegment(ChapterSegment segment) => this
    ..segments ??= <ChapterSegment>[]
    ..segments.add(segment);
}
