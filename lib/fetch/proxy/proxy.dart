import '../request/request.dart' show Request;
import '../response/response.dart' show Response;

abstract class Proxy {
  Response resolve(Request request);
}
