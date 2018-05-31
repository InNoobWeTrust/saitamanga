import 'dart:async' show Future;

import '../../domain/info/info_item.dart' show InfoItem;

abstract class Converter {
  Future<InfoItem> convertEntry(Map<String, Iterable<String>> rawInfo) async {
    Iterable<String> primary =
        rawInfo.entries.firstWhere((entry) => entry.key == 'primary').value;
    Iterable<Uri> extLinks = rawInfo.entries
        .where((entry) => entry.key == 'extLinks')
        .map((entry) => new MapEntry<String, Iterable<Uri>>(
            entry.key, entry.value.map((raw) => Uri.tryParse(raw))))
        .first
        .value;
    Map<String, Iterable<String>> meta = rawInfo
      ..removeWhere((key, value) => key == 'primary' || key == 'extLink');
    return new InfoItem(primary: primary, extLinks: extLinks, metaData: meta);
  }
}
