import 'dart:async' show Future, Stream;

import '../../domain/info/info_item.dart' show InfoItem;
import '../../parse/const/role.dart' show Role;

abstract class Converter {
  Future<InfoItem> convertEntry(
      Stream<MapEntry<Role, Stream<String>>> rawStream) async {
    List<String> primary = <String>[];
    List<Uri> link = <Uri>[];
    List<String> meta = <String>[];
    await for (MapEntry<Role, Stream<String>> raw in rawStream) {
      switch (raw.key) {
        case Role.primary:
          primary = await raw.value.toList();
          break;
        case Role.link:
          link = await raw.value
              .asyncMap<Uri>((str) => Uri.tryParse(str))
              .toList();
          break;
        case Role.meta:
          meta = await raw.value.toList();
          break;
      }
    }
    return new InfoItem(primary: primary, link: link, meta: meta);
  }
}
