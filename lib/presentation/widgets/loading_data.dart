import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/presentation/widgets/article_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        // enabled: true,
        // containersColor: Colors.red,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ArticleCard(
                article: Article(
                    source: Source(id: 'd', name: 'name'),
                    author: 'jghbsdjkfhbsdjkf sdjfghsdjfhsdjfi',
                    title:
                        'dfhdfgdfhdfgdfg dfgh dfgh df dfhgdfg dfg dfhg df gdfg  dfg dfg dfg dfg dfg dfg dfg dfg ',
                    description: 'description',
                    url: 'url',
                    urlToImage:
                        'https://cdn3.f-cdn.com/contestentries/2323840/65779657/652e516226395_thumbCard.jpg',
                    publishedAt: 'publishedAt',
                    content: 'content')),
          ),
        ),
      ),
    );
  }
}
