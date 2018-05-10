class CategoryInfo {
  final Uri uri;
  String name;

  CategoryInfo(this.uri, {this.name});

  CategoryInfo setName(String name) => this..name = name;
}
