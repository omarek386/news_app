import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleImage extends StatelessWidget {
  const TitleImage({
    super.key,
    required this.urlToImage,
  });

  final String urlToImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Image.network(
        urlToImage,
        height: 150.h,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
