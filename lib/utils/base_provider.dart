import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseProvider {
  final String baseUrl;

  const BaseProvider({this.baseUrl});

  Future get(final String url) async {
    final response = await http.get('$baseUrl$url');
    return _handleResponse(response);
  }

  Future post(final String url, final Object body) async {
    final response = await http.post('$baseUrl$url', body: body);
    return _handleResponse(response);
  }

  Future put(final String url, {final Object body}) async {
    final response = await http.put('$baseUrl$url', body: body);
    return _handleResponse(response);
  }

  Future delete(final String url) async {
    final response = await http.delete('$baseUrl$url');
    return _handleResponse(response);
  }

  _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    }
    throw Exception(json.decode(response.body)['error']);
  }
}
