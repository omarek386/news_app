// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:news_app/models/news.dart';
import '../models/articles.dart';

class NewsService {
  Dio dio;
  String apiKey1 = '98d04cab4bb24863b67db405242fef97';
  String apiKey2 = '847fea9aaa784f42b7dfb61e959cd8c4';
  NewsService({required this.dio});
  Future<List<Article>> getData({required String category}) async {
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey1&category=$category');
    // log(response.data.toString());
    News news = News.fromMap(response.data);
    List<Article> articles = news.articles;
    return articles;
    // return response.data;
  }
}
