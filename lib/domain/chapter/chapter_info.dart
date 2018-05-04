class ChapterInfo {
  final int index;
  final Uri uri;
  final String title;
  List<String> descriptions;
  String date;

  ChapterInfo(this.index, this.uri, this.title,
      {this.descriptions, this.date}) {
    assert(this.index is int);
    assert(this.uri is Uri);
    assert(this.title is String && this.title.isNotEmpty);
  }
}
