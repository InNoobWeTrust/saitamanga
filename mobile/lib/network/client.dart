import 'dart:async' show Future;
import 'package:http/http.dart';

class UserAgentClient extends BaseClient {
  static const String _defaultUserAgent = "Mozilla/5.0 (Windows NT 6.3; WOW64)";
  final String userAgent;
  final Client _inner = Client();

  UserAgentClient([this.userAgent = _defaultUserAgent]);

  void processHeader(Request request) {
    request.headers['user-agent'] = userAgent;
  }

  Future<StreamedResponse> send(BaseRequest request) async {
    processHeader(request);
    return _inner.send(request);
  }
}

class MangaReaderClient extends UserAgentClient {
  Map<String, dynamic> cookies = <String, dynamic>{};

  MangaReaderClient(
      [userAgent = UserAgentClient._defaultUserAgent, this.cookies])
      : super(userAgent);

  @override
  void processHeader(Request request) {
    super.processHeader(request);
    if (cookies.containsKey(request.url.host))
      request.headers['Cookie'] = cookies[request.url.host];
  }
}
