import 'package:news_app/core/failures_successes/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';

abstract class FetchRepo {
  Future<Either<Failures, List<NewsInfo>>> fetchNews(String? searchText);
}
