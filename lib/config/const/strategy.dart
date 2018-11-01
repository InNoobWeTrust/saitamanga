/// The strategy to use to parse raw data
///   - [html__css_select]: Use CSS Selector to get data
///   - [html__delegate]: Use external processor to get data
///   - [html__mixed__select_delegate]: Use CSS selector to filter and then delegate to external processor
enum Strategy {
  html__css_select,
  html__delegate,
  html__mixed__select_delegate,
}
