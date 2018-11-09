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
import '../const/method.dart' show Method;

class NetFetcher extends http.BaseClient {
  static const String _defaultUserAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64)";
  final String userAgent;
  final http.Client _inner = http.Client();
  final Map<String, dynamic> cookies;

  NetFetcher({
    this.userAgent = _defaultUserAgent,
    this.cookies = const <String, dynamic>{},
  });

  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      _inner.send(request);

  http.BaseRequest _netRequestFromRequest(Request request) {
    if (request.metadata?.method == Method.POST) {
      final http.StreamedRequest streamedRequest = http.StreamedRequest(
          request.metadata.method.toString(), request.rawLink)
        ..headers.addAll(request.headers);
      (request.data ??
              Stream<List<int>>.fromIterable([request.link.query.codeUnits]))
          .listen(streamedRequest.sink.add, onDone: streamedRequest.sink.close);
      return streamedRequest;
    }
    return http.Request(
        request.metadata?.method.toString() ?? Method.GET.toString(),
        request.link)
      ..headers.addAll(request.headers);
  }

  Response _responseFromStream(
    Request request,
    http.StreamedResponse streamedResponse,
  ) =>
      Response(
        request,
        headers: streamedResponse.headers,
        data: streamedResponse.stream,
      );

  Future<Response> fetch(Request request) async {
    final http.BaseRequest baseRequest = _netRequestFromRequest(request);
    final http.StreamedResponse streamedResponse = await send(baseRequest);
    final Response response = _responseFromStream(request, streamedResponse);
    return response;
  }
}
