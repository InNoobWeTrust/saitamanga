class InfoItem {
  List<String> primary = <String>[];
  List<Uri> link = <Uri>[];
  List<String> meta;

  InfoItem({this.primary, this.link, this.meta});

  @override
  String toString() => "primary: ${this.primary},"
      " link: ${this.link},"
      " meta: ${this.meta}";
}
