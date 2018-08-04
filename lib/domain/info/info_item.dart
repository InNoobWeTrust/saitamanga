class InfoItem {
  Iterable<String> primary;
  Iterable<Uri> extLinks;
  Map<String, Iterable<String>> metadata;

  InfoItem({this.primary, this.extLinks, this.metadata});

  InfoItem setPrimary(Iterable<String> primary) => this..primary = primary;

  InfoItem setExtLink(Iterable<Uri> extLinks) => this..extLinks = extLinks;

  InfoItem setMetadata(Map<String, Iterable<String>> metadata) =>
      this..metadata = metadata;

  @override
  String toString() => "primary: ${this.primary},"
      " extLinks: ${this.extLinks},"
      " metaData: ${this.metadata}";
}
