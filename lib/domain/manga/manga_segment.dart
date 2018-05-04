import '../chapter/chapter.dart' show Chapter;

class MangaSegment {
  final int index;
  final Uri uri;
  String id;
  List<Chapter> chapters;

  MangaSegment(this.index, this.uri, {this.id, this.chapters}) {
    assert(this.index is int);
    assert(this.uri is Uri);
  }
}
