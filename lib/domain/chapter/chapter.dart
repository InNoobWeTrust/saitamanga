import '../manga/manga_segment.dart' show MangaSegment;
import 'chapter_segment.dart' show ChapterSegment;

/// TODO: Add ChapterInfo class
class Chapter {
  final MangaSegment mangaSegment;
  final Uri initUri;
  final List<ChapterSegment> segments = <ChapterSegment>[];

  Chapter(this.mangaSegment, this.initUri);
}
