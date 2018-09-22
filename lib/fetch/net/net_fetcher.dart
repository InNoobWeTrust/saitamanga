import 'dart:async' show Future, Stream;

import 'package:http/http.dart' as http
    show
        BaseClient,
        Client,
        BaseRequest,
        Request,
        StreamedRequest,
        StreamedResponse;
import '../request/request.dart' show Request;
import '../response/response.dart' show Response;

class NetFetcher extends http.BaseClient {
  static const String _defaultUserAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64)";
  final String userAgent;
  final http.Client _inner = http.Client();
  final Map<String, dynamic> cookies;

  NetFetcher(
      {this.userAgent = _defaultUserAgent,
      this.cookies = const <String, dynamic>{}});

  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      _inner.send(request);

  Request _checkHeaders(Request request) {
    if (!(request.headers?.containsKey("user-agent") ?? false))
      request.addHeader("user-agent", this.userAgent);
    if (!(request.headers?.containsKey("Cookie") ?? false) &&
        this.cookies.containsKey(request.link.host))
      request.addHeader("Cookie", this.cookies[request.link.host]);
    if (!(request.metadata?.containsKey("method") ?? false))
      request.addMetadata("method", "GET");
    return request;
  }

  http.BaseRequest _netRequestFromRequest(Request request) {
    if (request.metadata["method"] == "POST") {
      final http.StreamedRequest streamedRequest =
          http.StreamedRequest("POST", request.rawLink)
            ..headers.addAll(request.headers);
      (request.data ??
              Stream.fromIterable<List<int>>([request.link.query.codeUnits]))
          .listen(streamedRequest.sink.add, onDone: streamedRequest.sink.close);
      return streamedRequest;
    }
    return http.Request(request.metadata["method"], request.link)
      ..headers.addAll(request.headers);
  }

  Response _responseFromStream(
          Request request, http.StreamedResponse streamedResponse) =>
      Response(request, streamedResponse.stream,
          headers: streamedResponse.headers);

  Future<Response> fetch(Request request) async {
    _checkHeaders(request);
    final http.BaseRequest baseRequest = _netRequestFromRequest(request);
    final http.StreamedResponse streamedResponse = await send(baseRequest);
    final Response response = _responseFromStream(request, streamedResponse);
    return response;
  }
}
