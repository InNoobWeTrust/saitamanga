class InfoItem {
  List<String> primary = <String>[];
  List<Uri> extLinks = <Uri>[];
  Map<String, Iterable<String>> metadata;

  InfoItem({this.primary, this.extLinks, this.metadata});

  @override
  String toString() => "primary: ${this.primary},"
      " extLinks: ${this.extLinks},"
      " metaData: ${this.metadata}";
}
