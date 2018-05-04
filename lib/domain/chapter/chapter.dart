import '../manga/manga.dart' show Manga;
import 'chapter_info.dart' show ChapterInfo;
import 'chapter_segment.dart' show ChapterSegment;

class Chapter {
  final Manga manga;
  ChapterInfo info;
  List<ChapterSegment> segments;

  Chapter(this.manga, {this.info, this.segments}) {
    assert(this.manga is Manga);
  }
}
