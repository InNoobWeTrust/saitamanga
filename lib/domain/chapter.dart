import 'page.dart';

class Chapter {
  final int index;
  final Uri uri;
  final String title;
  List<Page> pages;
  // Optional information
  List<String> descriptions;
  String date;

  Chapter(this.uri, this.title, {this.index}) {
    assert(this.uri == null);
    assert(this.title == null);
  }
}