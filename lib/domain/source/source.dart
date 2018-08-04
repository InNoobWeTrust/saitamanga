import 'source_info.dart' show SourceInfo;
import '../category/category.dart' show Category;

class Source {
  SourceInfo info;
  List<Category> defaultCategories;

  Source({this.info, this.defaultCategories});

  Source addDefaultCategories(List<Category> defaultCategories) => this
    ..defaultCategories ??= <Category>[]
    ..defaultCategories.addAll(defaultCategories);

  Source addDefaultCategory(Category defaultCategory) => this
    ..defaultCategories ??= <Category>[]
    ..defaultCategories.add(defaultCategory);
}
