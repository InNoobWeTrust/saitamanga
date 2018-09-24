import 'category_segment.dart' show CategorySegment;

/// TODO: Add CategoryInfo class
class Category {
  final Uri initUri;
  final List<CategorySegment> segments = <CategorySegment>[];

  Category(this.initUri);
}
