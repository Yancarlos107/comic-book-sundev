import 'dart:convert';

import 'package:comic_book/services/api_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../domain/domains.dart';

class IssuesRepository {
  final client = ApiClient('https://comicvine.gamespot.com/api/issues');

  Future fetchIssues(int limit, int offset) async {
    final response = await client.get('', headers: {}, queryParameters: {
      'api_key': dotenv.env['API_KEY']!,
      'format': 'json',
      'limit': limit.toString(),
      'offset': offset.toString(),
    });
    return LastIssuesModel.fromMap(jsonDecode(response.body));
  }
}
