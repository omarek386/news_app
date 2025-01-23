import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/articles.dart';

class AuthorDetails extends StatelessWidget {
  const AuthorDetails({
    super.key,
    required this.article,
    this.textWidth = 100,
  });

  final Article article;
  final double textWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        ClipOval(
          child: Image.network(
              errorBuilder: (context, error, stackTrace) =>
                  const CircularProgressIndicator(),
              width: 22.w,
              height: 22.h,
              fit: BoxFit.cover,
              'https://i1.sndcdn.com/avatars-3AMTJx3mBzeKnJMv-W6YFyw-t240x240.jpg'),
        ),
        SizedBox(
          width: textWidth.w,
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
    );
  }
}
