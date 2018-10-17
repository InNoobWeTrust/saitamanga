import '../manga/manga_segment.dart' show MangaSegment;
import 'chapter_segment.dart' show ChapterSegment;
import '../info/info.dart' show Info;

class Chapter {
  final MangaSegment mangaSegment;
  final Uri initUri;
  Info info;
  final List<ChapterSegment> segments = <ChapterSegment>[];

  Chapter(this.mangaSegment, this.initUri, {this.info});
}
