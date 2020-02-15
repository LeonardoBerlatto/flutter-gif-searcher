import 'package:dio/dio.dart';

abstract class BaseProvider<E> {
  final String baseUrl;

  Dio _client;

  BaseProvider({this.baseUrl}) {
    this._client = _getClient();
  }

  Dio _getClient() {
    return Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future get(final String url) async {
    final response = await _client.get('$baseUrl$url');
    return _handleResponse(response);
  }

  Future post(final String url, final Object body) async {
    final response = await _client.post('$baseUrl$url', data: body);
    return _handleResponse(response);
  }

  Future put(final String url, {final Object body}) async {
    final response = await _client.put('$baseUrl$url', data: body);
    return _handleResponse(response);
  }

  Future delete(final String url) async {
    final response = await _client.delete('$baseUrl$url');
    return _handleResponse(response);
  }

  _handleResponse(Response response) {
    return response.data['data'];
  }
}
