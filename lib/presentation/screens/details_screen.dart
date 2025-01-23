import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/presentation/widgets/author_details.dart';
import 'package:news_app/presentation/widgets/title_image.dart';
import 'package:news_app/themes/font_style.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details Screen', style: MyFontStyle.black20Bold),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            TitleImage(urlToImage: article.urlToImage),
            AuthorDetails(article: article, textWidth: 200),
            Text('Updated: ${article.publishedAt.substring(0, 10)}',
                style: MyFontStyle.grey12Normal),
            Text(
              article.title,
              style: MyFontStyle.black16Bold,
            ),
            Text(article.description, style: MyFontStyle.grey14Bold),
          ],
        ),
      ),
    );
  }
}
