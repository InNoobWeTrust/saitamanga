import 'source_info.dart' show SourceInfo;
import '../category/category.dart' show Category;

class Source {
  SourceInfo info;
  List<Category> defaultCategories;

  Source({this.info, this.defaultCategories});

  Source setInfo(SourceInfo info) => this..info = info;

  Source setDefaultCategories(List<Category> defaultCategories) =>
      this..defaultCategories = defaultCategories;

  Source addDefaultCategories(List<Category> defaultCategories) {
    if (this.defaultCategories == null)
      return setDefaultCategories(defaultCategories);
    return this..defaultCategories.addAll(defaultCategories);
  }

  Source addDefaultCategory(Category defaultCategory) {
    if (this.defaultCategories == null)
      this.defaultCategories = new List<Category>();
    return this..defaultCategories.add(defaultCategory);
  }
}
