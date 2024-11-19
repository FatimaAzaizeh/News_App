import 'package:dartz/dartz.dart';
import 'package:news_app/core/failures_successes/failures.dart';
import 'package:news_app/core/services_locator.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/features/show_news/domain/repositories/fetch_repo_contract.dart';

class FetchNewsUsecase {
  final FetchRepo fetchRepo = sl<FetchRepo>();

  Future<Either<Failures, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}
