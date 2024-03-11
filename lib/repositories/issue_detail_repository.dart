import '../services/api_client.dart';

class IssueDetailRepository {
  final String url;

  IssueDetailRepository({required this.url});

  void getIssueDetail() async {
    final api = ApiClient(url);
    final response = await api.get('', headers: {}, queryParameters: {
      'api_key': '6e3b959b1fcb098ce43cbba926e784aa51185e27',
      'format': 'json',
    });
    print(response.body);
  }
}