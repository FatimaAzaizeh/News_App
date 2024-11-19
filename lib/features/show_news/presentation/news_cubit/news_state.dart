part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {
  final List<NewsInfo> news;
  NewsInitial({required this.news});
}

final class NewsInitialSearch extends NewsState {
  final List<NewsInfo> news;
  NewsInitialSearch({required this.news});
}

final class NewsLoading extends NewsState {}

final class NewsError extends NewsState {}
