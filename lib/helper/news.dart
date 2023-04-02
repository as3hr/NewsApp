import 'dart:convert';

import '../models/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = <ArticleModel>[];

  Future<void> getnews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9910ff128f194e079f98bd57c2e6a671");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body.toString());

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel aritcle = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToimage: element['urlToImage'],
            content: element['content'],
          );
          news.add(aritcle);
        }
      });
    }
  }
}
