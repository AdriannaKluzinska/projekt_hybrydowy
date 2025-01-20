import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projekt_hybrydowy/controllers/news_controller.dart';
import 'package:projekt_hybrydowy/widgets/newsCard.dart';

import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 243, 252),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/news.png", height: 150, width: 150,)
          ],
        ),
      ),
      body: Obx(
          () => newsController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsPage(
                  author: newsController.newsArticles[index].author ?? "",
                  title: newsController.newsArticles[index].title,
                  description: newsController.newsArticles[index].description,
                  publishedAt: newsController.newsArticles[index].publishedAt.toString(),
                  imageUrl: newsController.newsArticles[index].urlToImage ?? "",
                  content: newsController.newsArticles[index].content,
                ))
            ),
            child: NewsCard(
              author: newsController.newsArticles[index].author ?? "",
              title: newsController.newsArticles[index].title,
              description: newsController.newsArticles[index].description,
              publishedAt: newsController.newsArticles[index].publishedAt.toString(),
              imageUrl: newsController.newsArticles[index].urlToImage ?? "",
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 2),
          itemCount: newsController.newsArticles.length,
        ),
      )
    );
  }
}