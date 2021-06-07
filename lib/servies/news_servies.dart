import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

class ApiService {
  final String apiKey = '9639bd377eee4525b4597a8dbd054113';

  Future<List<Article>> getArticles() async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];
      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('status code = ${response.statusCode}');
    }
  }

  Future<List<Article>> fetchArticlesByCategory(String category) async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];
      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('status code = ${response.statusCode}');
    }
  }
}
