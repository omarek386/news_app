import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Routers/routes.dart';
import 'package:news_app/logic/news_cubit.dart';
import 'package:news_app/presentation/widgets/article_card.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: context.read<NewsCubit>().newsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.details,
                    arguments: context.read<NewsCubit>().newsList[index]);
              },
              child: ArticleCard(
                article: context.read<NewsCubit>().newsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
