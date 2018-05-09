import '../manga/manga.dart' show Manga;

class SourceSegment {
  final int index;
  final Uri uri;
  List<Manga> mangas;

  SourceSegment(this.index, this.uri, {this.mangas}) {
    assert(this.index is int);
    assert(this.uri is Uri);
  }
}
