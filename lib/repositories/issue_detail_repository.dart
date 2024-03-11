import 'dart:convert';

import '../services/api_client.dart';

class IssueDetailRepository {
  Future getIssueDetail(String url) async {
    final api = ApiClient(url);
    final response = await api.get('', headers: {}, queryParameters: {
      'api_key': '6e3b959b1fcb098ce43cbba926e784aa51185e27',
      'format': 'json',
    });
    print(json.decode(response.body));
    return json.decode(response.body);
  }
}
