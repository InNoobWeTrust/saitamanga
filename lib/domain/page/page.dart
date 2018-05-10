import '../chapter/chapter.dart' show Chapter;

class Page {
  final Uri uri;
  Chapter chapter;
  int index;

  Page(this.uri, {this.chapter, this.index}) {}

  Page setChapter(Chapter chapter) => this..chapter = chapter;

  Page setIndex(int index) => this..index = index;
}
