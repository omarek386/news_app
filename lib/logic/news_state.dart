part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  NewsLoaded();
}

class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});
}
