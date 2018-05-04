import '../source.dart';
import 'manga_info.dart';
import 'manga_segment.dart';

class Manga {
  final Source source;
  MangaInfo info;
  List<MangaSegment> segments;

  Manga(this.source, {this.info, this.segments}) {
    assert(this.source is Source);
  }
}