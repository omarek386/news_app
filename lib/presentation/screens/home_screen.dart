import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/widgets/articles_list_view.dart';
import 'package:news_app/presentation/widgets/category_list_widget.dart';
import 'package:news_app/themes/font_style.dart';

import '../../logic/news_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = context.read<NewsCubit>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Newsify', style: MyFontStyle.black25Bold),
          centerTitle: true,
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial) {
              cubit.getNews();
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              return Column(
                children: [
                  CategoryListWidget(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'News For You',
                      style: MyFontStyle.black25Bold.copyWith(fontSize: 20.sp),
                    ),
                  ),
                  ArticlesListView(),
                ],
              );
            } else if (state is NewsError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ));
  }
}
