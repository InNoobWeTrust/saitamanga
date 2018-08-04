import '../chapter/chapter.dart' show Chapter;

class Page {
  final Uri uri;
  Chapter chapter;

  Page(this.uri, {this.chapter});
}
