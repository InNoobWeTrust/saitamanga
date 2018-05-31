import 'category_segment.dart' show CategorySegment;
import '../info/info_item.dart' show InfoItem;

class Category {
  Map<String, InfoItem> info;
  List<CategorySegment> segments;

  Category({this.info, this.segments});

  Category setInfo(Map<String, InfoItem> info) => this..info = info;

  Category setSegments(List<CategorySegment> segments) =>
      this..segments = segments;

  Category addSegments(List<CategorySegment> segments) {
    if (this.segments == null) return setSegments(segments);
    return this..segments = (new List<CategorySegment>()..addAll(segments));
  }

  Category addSegment(CategorySegment segment) {
    if (this.segments == null) this.segments = new List<CategorySegment>();
    return this..segments.add(segment);
  }
}
