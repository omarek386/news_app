// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:news_app/models/source.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: Source.fromMap(map['source'] as Map<String, dynamic>),
      author: map['author'] != null ? map['author'] as String : 'no author',
      title: map['title'] as String,
      description: map['description'] != null
          ? map['description'] as String
          : 'mo description',
      url: map['url'] as String,
      urlToImage: map['urlToImage'] != null
          ? map['urlToImage'] as String
          : 'https://media.cnn.com/api/v1/images/stellar/prod/ap25021532897195.jpg?c=16x9&q=w_800,c_fill',
      publishedAt:
          map['publishedAt'] != null ? map['publishedAt'] as String : '',
      content: map['content'] != null ? map['content'] as String : 'no content',
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);
}
