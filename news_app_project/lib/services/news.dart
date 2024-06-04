import 'dart:convert';


import 'package:news_app_project/models/news_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<newsModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&apiKey=f6df5d1c6c1745a683e4d530d7fb8a69";
    String tempDescrip = " ";
    var resp = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(resp.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['title'] != null) {
          if (element['description'] == null) {
            tempDescrip =
                "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
          } else {
            tempDescrip = element['description'];
          }
          if (element['urlToImage'] == null) {
            // ignore: non_constant_identifier_names
            newsModel NewsModel = newsModel(
                author: element['author'],
                title: element['title'],
                url: element['url'],
                description: tempDescrip,
                urlToImage:
                    'https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg',
                publishedAt: element['publishedAt'],
                content: element['content']);
            news.add(NewsModel);
          } else {
            // ignore: non_constant_identifier_names
            newsModel NewsModel = newsModel(
                author: element['author'],
                title: element['title'],
                description: tempDescrip,
                url: element['url'],
                urlToImage: element['urlToImage'],
                publishedAt: element['publishedAt'],
                content: element['content']);
            news.add(NewsModel);
          }
        }
      });
    }
  }
}
