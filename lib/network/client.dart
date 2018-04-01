import 'dart:async';
import 'package:http/http.dart';

class UserAgentClient extends BaseClient {
  final String userAgent;
  final Client _inner = new Client();

  UserAgentClient([this.userAgent="Mozilla/5.0 (Windows NT 6.3; WOW64)"]);

  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }
}