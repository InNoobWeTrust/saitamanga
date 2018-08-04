import '../chapter/chapter.dart' show Chapter;

class MangaSegment {
  final Uri uri;
  List<Chapter> chapters;

  MangaSegment(this.uri, {this.chapters});

  MangaSegment addChapters(List<Chapter> chapters) => this
    ..chapters ??= <Chapter>[]
    ..chapters.addAll(chapters);

  MangaSegment addChapter(Chapter chapter) => this
    ..chapters ??= <Chapter>[]
    ..chapters.add(chapter);
}
