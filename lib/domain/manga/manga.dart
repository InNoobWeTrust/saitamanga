import '../source/source.dart' show Source;
import 'manga_segment.dart' show MangaSegment;
import '../info/info_item.dart' show InfoItem;

class Manga {
  Source source;
  Map<String, InfoItem> info;
  List<MangaSegment> segments;

  Manga({this.source, this.info, this.segments});

  Manga addAllInfo(Map<String, InfoItem> info) => this
    ..info ??= <String, InfoItem>{}
    ..info.addAll(info);

  Manga addInfoEntry(MapEntry<String, InfoItem> infoEntry) => this
    ..info ??= <String, InfoItem>{}
    ..info.addEntries([infoEntry]);

  Manga addInfo(String name, InfoItem infoItem) =>
      this..addInfoEntry(new MapEntry(name, infoItem));

  Manga addSegments(List<MangaSegment> mangas) => this
    ..segments ??= <MangaSegment>[]
    ..segments.addAll(segments);

  Manga addSegment(MangaSegment segment) => this
    ..segments ??= <MangaSegment>[]
    ..segments.add(segment);
}
