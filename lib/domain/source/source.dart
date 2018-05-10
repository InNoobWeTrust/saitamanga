import 'source_info.dart' show SourceInfo;
import '../category/category.dart' show Category;

class Source {
  SourceInfo info;
  List<Category> categories;

  Source({this.info, this.categories}) {}

  Source setInfo(SourceInfo info) => this..info = info;

  Source setCategories(List<Category> categories) =>
      this..categories = categories;

  Source addCategories(List<Category> categories) {
    if (this.categories == null) return setCategories(categories);
    return this..categories.addAll(categories);
  }

  Source addCategory(Category category) {
    if (this.categories == null) this.categories = new List<Category>();
    return this..categories.add(category);
  }
}
