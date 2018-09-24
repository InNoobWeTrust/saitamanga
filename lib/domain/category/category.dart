import 'category_segment.dart' show CategorySegment;

class Category {
  List<CategorySegment> segments = <CategorySegment>[];

  Category();

  Category addSegments(List<CategorySegment> segments) => this
    ..segments ??= <CategorySegment>[]
    ..segments.addAll(segments);

  Category addSegment(CategorySegment segment) => this
    ..segments ??= <CategorySegment>[]
    ..segments.add(segment);
}
