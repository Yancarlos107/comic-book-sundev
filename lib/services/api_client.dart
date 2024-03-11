import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<Response> get(String path,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters}) async {
    var url = Uri.parse(baseUrl + path);
    if (queryParameters != null) {
      final queryParamsString = Uri(queryParameters: queryParameters)
          .queryParametersAll
          .entries
          .map((entry) =>
              '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value.first)}')
          .join('&');
      url = Uri.parse('$url?$queryParamsString');
    }
    final response = await http.get(url, headers: headers);
    handleResponse(response);

    return response;
  }

  Future<Response> put(String path,
      {Map<String, String>? headers, body}) async {
    final url = Uri.parse(baseUrl + path);
    final response = await http.put(url, headers: headers, body: body);

    handleResponse(response);

    return response;
  }

  Future<Response> post(String path,
      {Map<String, String>? headers, body}) async {
    final url = Uri.parse(baseUrl + path);
    final response = await http.post(url, headers: headers, body: body);
    handleResponse(response);

    return response;
  }

  Future<Response> delete(String path, {Map<String, String>? headers}) async {
    final url = Uri.parse(baseUrl + path);
    final response = await http.delete(url, headers: headers);

    handleResponse(response);

    return response;
  }

  void handleResponse(Response response) {
    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String body;

  ApiException(this.statusCode, this.body);

  @override
  String toString() {
    if (statusCode == 401) {}

    return 'ApiException(statusCode: $statusCode, body: $body)';
  }
}
