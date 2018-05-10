import '../manga/manga.dart' show Manga;

class CategorySegment {
  final Uri uri;
  List<Manga> mangas;

  CategorySegment(this.uri, {this.mangas});

  CategorySegment setMangas(List<Manga> mangas) => this..mangas = mangas;

  CategorySegment addMangas(List<Manga> mangas) {
    if (this.mangas == null) return setMangas(mangas);
    return this..mangas.addAll(mangas);
  }

  CategorySegment addManga(Manga manga) {
    if (this.mangas == null) this.mangas = new List<Manga>();
    return this..mangas.add(manga);
  }
}
