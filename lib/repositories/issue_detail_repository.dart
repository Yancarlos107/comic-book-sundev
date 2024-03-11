import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../domain/domains.dart';
import '../services/api_client.dart';

class IssueDetailRepository {
  Future getIssueDetail(String url) async {
    final api = ApiClient(url);
    final response = await api.get('', headers: {}, queryParameters: {
      'api_key': dotenv.env['API_KEY']!,
      'format': 'json',
    });
    return IssueDetailResult.fromMap(jsonDecode(response.body));
  }
}
