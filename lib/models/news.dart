// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:news_app/models/articles.dart';

class News {
  String status;
  int totalResults;
  List<Article> articles;

  News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: List<Article>.from(
        (map['articles'] as List).map<Article>(
          (x) => Article.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);
}
