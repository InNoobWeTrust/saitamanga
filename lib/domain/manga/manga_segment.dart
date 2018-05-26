import '../chapter/chapter.dart' show Chapter;

class MangaSegment {
  final Uri uri;
  List<Chapter> chapters;

  MangaSegment(this.uri, {this.chapters});

  MangaSegment setChapters(List<Chapter> chapters) => this..chapters = chapters;

  MangaSegment addChapters(List<Chapter> chapters) {
    if (this.chapters == null) return setChapters(chapters);
    return this..chapters.addAll(chapters);
  }

  MangaSegment addChapter(Chapter chapter) {
    if (this.chapters == null) this.chapters = new List<Chapter>();
    return this..chapters.add(chapter);
  }
}
