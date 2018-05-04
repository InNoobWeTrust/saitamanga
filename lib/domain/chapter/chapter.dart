import '../manga/manga.dart';
import 'chapter_info.dart';
import 'chapter_segment.dart';

class Chapter {
  final Manga manga;
  ChapterInfo info;
  List<ChapterSegment> segments;

  Chapter(this.manga, {this.info, this.segments}) {
    assert(this.manga is Manga);
  }
}