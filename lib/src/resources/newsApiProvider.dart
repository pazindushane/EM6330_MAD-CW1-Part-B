import 'package:news_app/src/helpers/constants.dart';
import 'package:news_app/src/models/newsResponseModel.dart';
import 'package:http/http.dart';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = Constant.newsApiKey;

  Future<List<Article>> fetchNewsList({String category = ''}) async {
    var url =
        "${Constant.baseUrl}${Constant.topHeadLine}?country=in&apiKey=$_apiKey&category=$category";
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return NewsApiResonse.fromRawJson(response.body).articles;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
