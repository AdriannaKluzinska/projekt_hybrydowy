import 'package:http/http.dart' as http;
import 'package:projekt_hybrydowy/models/news_model.dart';
import 'package:projekt_hybrydowy/private.dart';

class RemoteNewsService {
  static var client = http.Client();
  static Future <List<NewsArticle> ?> fetchNewsArticle() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2025-01-17&to=2025-01-17&sortBy=popularity&apiKey=$apiKey"
    ));

    if (response.statusCode == 200) {
      return newArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}