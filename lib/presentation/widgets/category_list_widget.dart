import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/logic/news_cubit.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemCount: context.read<NewsCubit>().categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: MaterialButton(
              // height: 10.h,
              onPressed: () {
                context.read<NewsCubit>().selectCategory(
                    context.read<NewsCubit>().categories[index]);
              },
              // disabledColor: Colors.red,
              color: context.read<NewsCubit>().selectedCategory ==
                      context.read<NewsCubit>().categories[index]
                  ? Colors.blue
                  : Colors.white,

              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                context.read<NewsCubit>().categories[index],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
