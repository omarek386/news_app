import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/articles.dart';

import '../services/news_service.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  List<Article> newsList = [];
  List<String> categories = [
    'general',
    'entertainment',
    'business',
    'health',
    'science',
    'sports',
    'technology'
  ];
  List<String> logo = [
    'assets/genral.json',
    'assets/entertament.json',
    'assets/business.json',
    'assets/health.json',
    'assets/science.json',
    'assets/sports.json',
    'assets/tech.json'
  ];
  String selectedLogo = 'assets/genral.json';
  String selectedCategory = 'general';

  set setSelectedLogo(String value) {
    selectedLogo = value;
  }

  set selectCategory(String category) {
    selectedCategory = category;
  }

  void getNews() async {
    emit(NewsLoading());
    try {
      newsList =
          await NewsService(dio: Dio()).getData(category: selectedCategory);
      emit(NewsLoaded());
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}
