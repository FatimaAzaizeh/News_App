import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/failures_successes/failures.dart';
import 'package:news_app/core/services_locator.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/features/show_news/domain/usecases/fetch_news.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial(news: const []));

  final FetchNewsUsecase _fetchNewsUsecase = sl<FetchNewsUsecase>();
  void fetchNews(String? searchText) async {
    emit(NewsLoading());
    final Either<Failures, List<NewsInfo>> fetchNewsResult =
        await _fetchNewsUsecase.fetchNews(searchText);
    fetchNewsResult.fold((l) {
      emit(NewsError());
    }, (news) {
      if (searchText != null) {
        emit(NewsInitialSearch(news: news));
      } else {
        emit(NewsInitial(news: news));
      }
    });
  }
}
