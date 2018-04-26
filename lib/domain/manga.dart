import 'chapter.dart';

class Manga {
  final Uri uri;
  final String title;
  List<String> alternativeTitles;
  List<Chapter> chapters;
  // Those fields below might get their own classes in the future
  List<String> sources;
  List<String> authors;
  List<String> artists;
  List<String> tlTeams;
  List<String> languages;
  List<String> types;
  List<String> genres;
  List<String> descriptions;
  List<String> warnings;

  Manga(this.uri, this.title) {
    assert(this.uri != null);
    assert(this.title != null);
  }
}