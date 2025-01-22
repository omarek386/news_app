import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/articles.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 350.w,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(255),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        spacing: 10.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              article.urlToImage,
              height: 90.h,
              width: 130.w,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // textBaseline: TextBaseline.ideographic,
            spacing: 5.h,
            children: [
              Row(
                spacing: 10.w,
                children: [
                  ClipOval(
                    child: Image.network(
                        width: 22.w,
                        height: 22.h,
                        fit: BoxFit.cover,
                        'https://media.cnn.com/api/v1/images/stellar/prod/ap25021532897195.jpg?c=16x9&q=w_800,c_fill'),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      maxLines: 1,
                      article.author,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 190.w,
                child: Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 180.w,
                child: Text(
                  article.publishedAt.substring(0, 10),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
