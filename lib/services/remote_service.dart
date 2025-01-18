import 'package:http/http.dart' as http;
import 'package:projekt_hybrydowy/models/news_model.dart';
import 'package:projekt_hybrydowy/private.dart';

class RemoteNewsService {
  static var client = http.Client();
  static Future <List<NewsArticle> ?> fetchNewsArticle() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey"
    ));

    if (response.statusCode == 200) {
      return newArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}