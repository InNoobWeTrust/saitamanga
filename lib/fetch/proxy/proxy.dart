import 'dart:async' show Future;

import '../request/request.dart' show Request;
import '../response/response.dart' show Response;

abstract class Proxy {
  Future<Response> resolve(Request request);
}
