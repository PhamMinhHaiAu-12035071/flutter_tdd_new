import 'dart:convert';

import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/data_providers/user_api.dart';
import 'package:flutter_tdd_new/shared/data/networks/client_common.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.prod)
@Environment(Env.stg)
@Environment(Env.dev)
@Environment(Env.endToEndTest)
@Singleton(as: UserAPI)
class UserAPIImpl implements UserAPI {
  const UserAPIImpl({
    required FlavorConfig flavorConfig,
    required ClientCommon clientCommon,
  })  : _flavorConfig = flavorConfig,
        _client = clientCommon;

  final FlavorConfig _flavorConfig;
  final ClientCommon _client;

  String get pathLogin => '/api/login';

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('${_flavorConfig.baseUrl}$pathLogin');
    final obj = <String, dynamic>{
      'email': email,
      'password': password,
    };
    final params = jsonEncode(obj);
    final response = await _client.post(url, body: params);
    return response;
  }

  @override
  Future<Response> register({required String email, required String password}) {
    throw UnimplementedError();
  }
}
