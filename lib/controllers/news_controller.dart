import 'package:get/get.dart';
import 'package:projekt_hybrydowy/models/news_model.dart';
import 'package:projekt_hybrydowy/services/remote_service.dart';

class NewsController extends GetxController {
  var newsArticles = <NewsArticle>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var articles = await RemoteNewsService.fetchNewsArticle();

      if (articles != null) {
        newsArticles(articles);
      }
    }
    finally {
      isLoading(false);
    }
  }
}