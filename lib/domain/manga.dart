import 'source.dart';
import 'chapter.dart';
import 'cover.dart';

class Manga {
  final Source source;
  final Uri uri;
  final String title;
  Cover cover;
  List<String> alternativeTitles;
  List<Chapter> chapters;
  // Those fields below might get their own classes in the future
  List<String> authors;
  List<String> artists;
  List<String> tlTeams;
  List<String> languages;
  List<String> types;
  List<String> genres;
  List<String> descriptions;
  List<String> warnings;

  Manga(this.uri, this.title, {this.source}) {
    assert(this.uri != null);
    assert(this.title != null);
  }
}