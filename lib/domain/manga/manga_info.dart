import 'manga_cover.dart' show MangaCover;
import 'age_rating.dart' show AgeRating;

class MangaInfo {
  final Uri uri;
  String title;
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

  MangaInfo(this.uri,
      {this.title,
      this.cover,
      this.alternativeTitles,
      this.authors,
      this.artists,
      this.translationTeams,
      this.languages,
      this.types,
      this.genres,
      this.descriptions,
      this.warnings,
      this.ageRating}) {}

  MangaInfo setTitle(String title) => this..title = title;

  MangaInfo setCover(MangaCover cover) => this..cover = cover;

  MangaInfo setAlterNativeTitles(List<String> alternativeTitles) =>
      this..alternativeTitles = alternativeTitles;

  MangaInfo addAlternativeTitles(List<String> alternativeTitles) {
    if (this.alternativeTitles == null)
      return setAlterNativeTitles(alternativeTitles);
    return this..alternativeTitles.addAll(alternativeTitles);
  }

  MangaInfo addAlternativeTitle(String alternativeTitle) {
    if (this.alternativeTitles == null)
      this.alternativeTitles = new List<String>();
    return this..alternativeTitles.add(alternativeTitle);
  }

  MangaInfo setAuthors(List<String> authors) => this..authors = authors;

  MangaInfo addAuthors(List<String> authors) {
    if (this.authors == null) return setAuthors(authors);
    return this..authors.addAll(authors);
  }

  MangaInfo addAuthor(String author) {
    if (this.authors == null) this.authors = new List<String>();
    return this..authors.add(author);
  }

  MangaInfo setArtists(List<String> artists) => this..artists = artists;

  MangaInfo addArtists(List<String> artists) {
    if (this.artists == null) return setArtists(artists);
    return this..artists.addAll(artists);
  }

  MangaInfo addArtist(String artist) {
    if (this.artists == null) this.artists = new List<String>();
    return this..artists.add(artist);
  }

  MangaInfo setTranslationTeams(List<String> translationTeams) =>
      this..translationTeams = translationTeams;

  MangaInfo addTranslationTeams(List<String> translationTeams) {
    if (this.translationTeams == null)
      return setTranslationTeams(translationTeams);
    return this..translationTeams.addAll(translationTeams);
  }

  MangaInfo addTranslationTeam(String translationTeam) {
    if (this.translationTeams == null)
      this.translationTeams = new List<String>();
    return this..translationTeams.add(translationTeam);
  }

  MangaInfo setLanguages(List<String> languages) => this..languages = languages;

  MangaInfo addLanguages(List<String> languages) {
    if (this.languages == null) return setLanguages(languages);
    return this..languages.addAll(languages);
  }

  MangaInfo addLanguage(String language) {
    if (this.languages == null) this.languages = new List<String>();
    return this..languages.add(language);
  }

  MangaInfo setTypes(List<String> types) => this..types = types;

  MangaInfo addTypes(List<String> types) {
    if (this.types == null) return setTypes(types);
    return this..types.addAll(types);
  }

  MangaInfo addType(String type) {
    if (this.types == null) this.types = new List<String>();
    return this..types.add(type);
  }

  MangaInfo setGenres(List<String> genres) => this..genres = genres;

  MangaInfo addGenres(List<String> genres) {
    if (this.genres == null) return setGenres(genres);
    return this..genres.addAll(genres);
  }

  MangaInfo addGenre(String genre) {
    if (this.genres == null) this.genres = new List<String>();
    return this..genres.add(genre);
  }

  MangaInfo setDescriptions(List<String> descriptions) =>
      this..descriptions = descriptions;

  MangaInfo addDescriptions(List<String> descriptions) {
    if (this.descriptions == null) return setDescriptions(descriptions);
    return this..descriptions.addAll(descriptions);
  }

  MangaInfo addDescription(String description) {
    if (this.descriptions == null) this.descriptions = new List<String>();
    return this..descriptions.add(description);
  }

  MangaInfo setWarnings(List<String> warnings) => this..warnings = warnings;

  MangaInfo addWarnings(List<String> warnings) {
    if (this.warnings == null) return setWarnings(warnings);
    return this..warnings.addAll(warnings);
  }

  MangaInfo addWarning(String warning) {
    if (this.warnings == null) this.warnings = new List<String>();
    return this..warnings.add(warning);
  }

  MangaInfo setAgeRating(AgeRating ageRating) => this..ageRating = ageRating;
}
