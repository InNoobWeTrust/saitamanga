import 'dart:async' show Future, Stream;

import '../../domain/info/info_item.dart' show InfoItem;

abstract class Converter {
  Future<InfoItem> convertEntry(
      Stream<MapEntry<String, Stream<String>>> rawStream) async {
    List<String> primary = <String>[];
    List<Uri> extLinks = <Uri>[];
    Map<String, Iterable<String>> meta = <String, Iterable<String>>{};
    await for (MapEntry<String, Stream<String>> raw in rawStream) {
      switch (raw.key) {
        case 'primary':
          if (primary == null) primary = await raw.value.toList();
          break;
        case 'link':
          if (extLinks == null)
            extLinks = await raw.value
                .asyncMap<Uri>((str) => Uri.tryParse(str))
                .toList();
          break;
        default:
          meta[raw.key] = await raw.value.toList();
          break;
      }
    }
    return new InfoItem(primary: primary, extLinks: extLinks, metadata: meta);
  }
}
