import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/presentation/screens/details_screen.dart';

import '../logic/news_cubit.dart';
import '../presentation/screens/home_screen.dart';
import 'routes.dart';

class AppRouter {
  NewsCubit newsCubit = NewsCubit();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => newsCubit, child: const HomeScreen()));
      case Routes.details:
        Article article = settings.arguments as Article;
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(
                  article: article,
                ));
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
