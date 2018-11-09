import 'dart:convert' show JsonEncoder;

import 'package:test/test.dart';

import '../../../../lib/fetch/request/request.dart' show Request;
import '../../../../lib/fetch/response/response.dart' show Response;
import '../../../../lib/fetch/net/net_fetcher.dart' show NetFetcher;

final Iterable<Uri> testSites = [
  "https://www.google.com/",
  "http://hocvientruyentranh.net/",
  "http://truyentranhtuan.com/",
]
    .map((s) => Uri.tryParse(
          s,
        ))
    .where((uri) => uri != null);

void main() {
  test(
      "[Unit - fetch/net/net_fetcher.dart] "
      "Test net_fetcher.dart", () async {
    final NetFetcher netFetcher = NetFetcher();
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    for (Uri site in testSites) {
      final Request request = Request(
        site,
      );
      print("\nBefore: ${encoder.convert(request.headers)}");
      final Response response = await netFetcher.fetch(request);
      expect(
        response.headers,
        isNotEmpty,
      );
      print("After autofill: ${encoder.convert(request.headers)}");
      print("Response headers: ${encoder.convert(response.headers)}");
    }
  });
}
