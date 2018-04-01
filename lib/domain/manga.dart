import 'chapter.dart';
import 'dart:io';

class Manga {
  final Uri uri;
  final String title;
  List<String> alternativeTitles;
  List<Chapter> chapters;
  Directory folder;
  // TODO: add fields for syncing and advanced features
  // Those fields below might get their own class in the future
  List<String> sources;
  List<String> authors;
  List<String> artists;
  List<String> tlTeams;
  List<String> languages;
  List<String> types;
  List<String> genres;
  List<String> descriptions;
  List<String> warnings;

  Manga(this.uri, this.title, [this.folder]) {
    assert(this.uri != null);
    assert(this.title != null);
  }
}