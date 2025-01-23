import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/presentation/widgets/article_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../logic/news_cubit.dart';

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
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: BlocProvider.of<NewsCubit>(context).newsList.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ArticleCard(
                article: Article(
                    source: Source(id: 'd', name: 'name'),
                    author: 'jghbsdjkfhbsdjkf sdjfghsdjfhsd',
                    title:
                        'dfhdfgdfhdfgdfg dfgh dfgh df dfhgdfg dfg dfhg df gdfg  dfg dfg dfg dfg dfg dfg dfg dfg ',
                    description: 'description',
                    url: 'url',
                    urlToImage:
                        'https://i1.sndcdn.com/avatars-3AMTJx3mBzeKnJMv-W6YFyw-t240x240.jpg',
                    publishedAt: 'publishedAt',
                    content: 'content')),
          ),
        ),
      ),
    );
  }
}
