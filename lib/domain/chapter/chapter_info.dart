class ChapterInfo {
  final Uri uri;
  int index;
  String title;
  List<String> descriptions;
  String date;

  ChapterInfo(this.uri,
      {this.index, this.title, this.descriptions, this.date}) {}

  ChapterInfo setIndex(int index) => this..index = index;

  ChapterInfo setTitle(String title) => this..title = title;

  ChapterInfo setDescriptions(List<String> descriptions) =>
      this..descriptions = descriptions;

  ChapterInfo addDescriptions(List<String> descriptions) {
    if (descriptions == null) return addDescriptions(descriptions);
    return this..descriptions.addAll(descriptions);
  }

  ChapterInfo addDescription(String description) {
    if (this.descriptions == null) this.descriptions = new List<String>();
    return this..descriptions.add(description);
  }

  ChapterInfo setDate(String date) => this..date = date;
}
