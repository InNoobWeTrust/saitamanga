import '../../config/view_config.dart' show ViewConfig;
import '../../parse/parse_product.dart' show ParseProduct;

/// Store the data of the view
class View {
  /// Configure how the view will behave
  final ViewConfig config;

  /// Cache for each page in the pagination
  final Map<int, List<ParseProduct>> pages = <int, List<ParseProduct>>{};
  int _curr = -1;

  /// The current page number this view is showing
  int get currentPage => this._curr;
  int _prev = -1;

  /// The previous page number
  int get previousPage => this._prev;
  int _next = -1;

  /// The next page number
  int get nextPage => this._next;

  View(this.config);

  /// Go back to arbitrary page in cache
  ///
  /// Will throw exception if the cache for that page
  /// is not found
  void goTo(int page) {
    if (!this.pages.containsKey(page)) throw Exception('Page is not in cache!');
    this._curr = page;
  }

  /// Advance to next page
  ///
  /// Will throw exception if the cache for next page
  /// is not found
  void next() => this.goTo(this.currentPage + 1);

  /// Back to previous page
  ///
  /// Will throw exception if the cache for previous page
  /// is not found
  void previous() => this.goTo(this.currentPage - 1);
}
