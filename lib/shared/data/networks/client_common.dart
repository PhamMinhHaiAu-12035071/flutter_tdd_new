import 'package:http/http.dart';

abstract class ClientCommon implements Client {
  Map<String, String> get defaultHeaders;
}
