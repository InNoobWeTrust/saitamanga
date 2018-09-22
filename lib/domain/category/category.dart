import '../../parse/parse_product.dart' show ParseProduct;
import 'category_segment.dart' show CategorySegment;

class Category {
  List<ParseProduct> elements;
  List<CategorySegment> segments = <CategorySegment>[];

  Category();

  Category setElements(List<ParseProduct> elements) =>
      this..elements = elements;

  Category addSegments(List<CategorySegment> segments) => this
    ..segments ??= <CategorySegment>[]
    ..segments.addAll(segments);

  Category addSegment(CategorySegment segment) => this
    ..segments ??= <CategorySegment>[]
    ..segments.add(segment);
}
