import 'package:http/http.dart';

abstract class UserAPI {
  String get pathLogin;
  Future<Response> login({required String email, required String password});
  Future<Response> register({required String email, required String password});
}
