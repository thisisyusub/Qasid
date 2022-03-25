import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<String> fetchFeed(String feedUrl);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  const NewsRemoteDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<String> fetchFeed(String feedUrl) async {
    final response = await client.get(Uri.parse(feedUrl));
    return response.body;
  }
}
