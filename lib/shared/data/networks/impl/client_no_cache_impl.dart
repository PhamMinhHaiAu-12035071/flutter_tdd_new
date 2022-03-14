import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/shared/data/networks/client_no_cache.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.prod)
@Environment(Env.stg)
@Environment(Env.dev)
@Environment(Env.endToEndTest)
@Singleton(as: ClientNoCache)
class ClientNoCacheImpl implements ClientNoCache {
  ClientNoCacheImpl({required Client client})
      : _client = client,
        super();

  final Client _client;

  static const defaultHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    HttpHeaders.cacheControlHeader: 'no-cache',
  };
  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _client.post(
      url,
      headers: _mergedHeaders(headers),
      body: body,
      encoding: encoding,
    );
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    return _client.send(request);
  }

  Map<String, String> _mergedHeaders(Map<String, String>? headers) {
    if (headers != null) {
      return {}
        ..addAll(defaultHeaders)
        ..addAll(headers);
    }
    return defaultHeaders;
  }

  @override
  void close() {
    return _client.close();
  }

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _client.delete(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) {
    return _client.get(url, headers: headers);
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) {
    return _client.head(url, headers: headers);
  }

  @override
  Future<Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _client.patch(url, headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _client.put(url, headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    return _client.read(url, headers: headers);
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    return readBytes(url, headers: headers);
  }
}
