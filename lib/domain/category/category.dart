import 'category_segment.dart' show CategorySegment;
import '../info/info_item.dart' show InfoItem;

class Category {
  Map<String, InfoItem> info;
  List<CategorySegment> segments;

  Category();

  Category setInfo(Map<String, InfoItem> info) => this..info = info;

  Category addSegments(List<CategorySegment> segments) => this
    ..segments ??= <CategorySegment>[]
    ..segments.addAll(segments);

  Category addSegment(CategorySegment segment) => this
    ..segments ??= <CategorySegment>[]
    ..segments.add(segment);
}
