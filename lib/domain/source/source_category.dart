import 'source_segment.dart' show SourceSegment;

class SourceCategory {
  final String name;
  List<SourceSegment> segments;

  SourceCategory(this.name) {
    assert(this.name is String && this.name.isNotEmpty);
  }
}
