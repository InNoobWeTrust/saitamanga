class InfoItem {
  Iterable<String> primary;
  Iterable<Uri> extLinks;
  Map<String, Iterable<String>> metaData;

  InfoItem({this.primary, this.extLinks, this.metaData});

  InfoItem setPrimary(Iterable<String> primary) => this..primary = primary;

  InfoItem setExtLink(Iterable<Uri> extLinks) => this..extLinks = extLinks;

  InfoItem setMetaData(Map<String, Iterable<String>> metaData) =>
      this..metaData = metaData;

  @override
  String toString() => "primary: ${this.primary},"
      " extLinks: ${this.extLinks},"
      " metaData: ${this.metaData}";
}
