import 'source_info.dart' show SourceInfo;
import 'source_category.dart' show SourceCategory;

class Source {
  SourceInfo info;
  List<SourceCategory> categories;

  Source({this.info}) {
    assert(this.info is SourceInfo);
  }
}
