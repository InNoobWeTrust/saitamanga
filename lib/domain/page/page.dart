import '../chapter/chapter_segment.dart' show ChapterSegment;

class Page {
  final ChapterSegment chapterSegment;
  final Uri uri;

  Page(this.chapterSegment, this.uri);
}
