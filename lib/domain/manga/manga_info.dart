import 'manga_cover.dart' show MangaCover;
import 'age_rating.dart' show AgeRating;

class MangaInfo {
  final Uri uri;
  final String title;
  MangaCover cover;
  List<String> alternativeTitles;
  List<String> authors;
  List<String> artists;
  List<String> translationTeams;
  List<String> languages;
  List<String> types;
  List<String> genres;
  List<String> descriptions;
  List<String> warnings;
  AgeRating ageRating;

  MangaInfo(this.uri, this.title,
      {this.alternativeTitles,
      this.authors,
      this.artists,
      this.translationTeams,
      this.languages,
      this.types,
      this.genres,
      this.descriptions,
      this.warnings}) {
    assert(this.uri is Uri);
    assert(this.title is String && this.title.isNotEmpty);
  }
}
