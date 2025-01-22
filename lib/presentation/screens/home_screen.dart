import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/news_cubit.dart';
import '../widgets/article_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Newsify',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => NewsCubit(),
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsInitial) {
                context.read<NewsCubit>().getNews();
                return Center(child: CircularProgressIndicator());
              } else if (state is NewsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NewsLoaded) {
                return Column(
                  children: [
                    Container(
                      height: 50.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: context.read<NewsCubit>().categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.read<NewsCubit>().selectCategory(
                                  context.read<NewsCubit>().categories[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                color: context
                                            .read<NewsCubit>()
                                            .selectedCategory ==
                                        context
                                            .read<NewsCubit>()
                                            .categories[index]
                                    ? Colors.deepPurple
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Center(
                                child: Text(
                                  context.read<NewsCubit>().categories[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: context.read<NewsCubit>().newsList.length,
                        itemBuilder: (context, index) {
                          return ArticleCard(
                            article: context.read<NewsCubit>().newsList[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
                // return ListView.builder(
                //   itemCount: context.read<NewsCubit>().newsList.length,
                //   itemBuilder: (context, index) {
                //     return ArticleCard(
                //       article: context.read<NewsCubit>().newsList[index],
                //     );
                //   },
                // );
              } else if (state is NewsError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}
