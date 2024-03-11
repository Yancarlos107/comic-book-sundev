import 'dart:convert';

import 'package:comic_book/services/api_client.dart';

class IssuesRepository {
  final client = ApiClient('https://comicvine.gamespot.com/api/issues');

  Future fetchIssues(int limit, int offset) async {
    final response = await client.get('', headers: {}, queryParameters: {
      'api_key': '6e3b959b1fcb098ce43cbba926e784aa51185e27',
      'format': 'json',
      'limit': limit.toString(),
      'offset': offset.toString(),
    });
    return jsonDecode(response.body);
  }
}
