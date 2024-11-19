import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:news_app/features/show_news/data/repositories/fetch_repo_impl.dart';
import 'package:news_app/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:news_app/features/show_news/domain/usecases/fetch_news.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setUpServices() {
  // Register ApiService
  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  // Register FetchFromRemoteDS
  sl.registerLazySingleton<FetchFromRemoteDS>(() => FetchFromRemoteDSImpl());

  // Register FetchRepo
  sl.registerLazySingleton<FetchRepo>(() => FetchRepoImpl());

  // Register FetchNewsUsecase
  sl.registerLazySingleton<FetchNewsUsecase>(() => FetchNewsUsecase());
}
