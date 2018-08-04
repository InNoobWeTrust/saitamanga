import '../manga/manga.dart' show Manga;

class CategorySegment {
  final Uri uri;
  List<Manga> mangas = <Manga>[];

  CategorySegment(this.uri);

  CategorySegment addMangas(List<Manga> mangas) => this
    ..mangas ??= <Manga>[]
    ..mangas.addAll(mangas);

  CategorySegment addManga(Manga manga) => this
    ..mangas ??= <Manga>[]
    ..mangas.add(manga);

  CategorySegment removeMangas(bool condition(Manga manga)) =>
      this..mangas.removeWhere(condition);
}
