import 'package:http/http.dart';

abstract class UserAPI {
  Future<Response> login({required String email, required String password});
  Future<Response> register({required String email, required String password});
}
