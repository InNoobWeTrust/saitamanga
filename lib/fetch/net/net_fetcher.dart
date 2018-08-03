import 'dart:async' show Future;

import 'package:http/http.dart'
    show BaseClient, Client, BaseRequest, StreamedRequest, StreamedResponse;
import '../request/request.dart' show Request;
import '../response/response.dart' show Response;

class NetFetcher extends BaseClient {
  static const String _defaultUserAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64)";
  final String userAgent;
  final Client _inner = new Client();
  Map<String, dynamic> cookies = <String, dynamic>{};

  NetFetcher({this.userAgent = _defaultUserAgent});

  Future<StreamedResponse> send(BaseRequest request) => _inner.send(request);

  Future<Response> fetch(Request request) async {
    if (!request.headers.containsKey("user-agent"))
      request.headers["user-agent"] = this.userAgent;
    if (!request.headers.containsKey("Cookie") &&
        this.cookies.containsKey(request.link.host))
      request.headers["Cookie"] = this.cookies[request.link.host];
    final String method = request.metadata.containsKey("method")
        ? request.metadata["method"]
        : "GET";
    final StreamedRequest streamedRequest =
        new StreamedRequest(method, request.link)
          ..headers.addAll(request.headers);
    if (method == "POST") request.data.listen(streamedRequest.sink.add);
    final StreamedResponse streamedResponse = await send(streamedRequest);
    final Response response = new Response(request, streamedResponse.stream,
        headers: streamedResponse.headers);
    return response;
  }
}
