import 'dart:async' show Future, Stream;

import '../../domain/info/info_item.dart' show InfoItem;

abstract class Converter {
  Future<InfoItem> convertEntry(
      Stream<MapEntry<String, Stream<String>>> rawStream) async {
    Iterable<String> primary;
    Iterable<Uri> extLinks;
    Map<String, Iterable<String>> meta = new Map<String, Iterable<String>>();
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
