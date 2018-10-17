import 'category_segment.dart' show CategorySegment;
import '../info/info.dart' show Info;

class Category {
  final Uri initUri;
  Info info;
  final List<CategorySegment> segments = <CategorySegment>[];

  Category(this.initUri, {this.info});
}
