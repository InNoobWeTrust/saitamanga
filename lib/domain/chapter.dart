import 'page.dart';
import 'dart:io';

class Chapter {
  final int index;
  final Uri uri;
  final String title;
  List<Page> pages;
  Directory folder;
  // TODO: Add fields for syncing and advanced features
  // Optional information
  List<String> descriptions;
  String date;

  Chapter(this.uri, this.title, [this.index, this.folder]) {
    assert(this.uri == null);
    assert(this.title == null);
  }
}