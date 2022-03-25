import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_sources/local/news_source_data_source.dart';
import 'data/data_sources/local/preferences_data_source.dart';
import 'data/data_sources/remote/news_remote_data_source.dart';
import 'data/repositories/news_repository_impl.dart';
import 'data/repositories/news_source_repository_impl.dart';
import 'data/repositories/preferences_repository_impl.dart';
import 'domain/repositories/news_repository.dart';
import 'domain/repositories/news_source_repository.dart';
import 'domain/repositories/preferences_repository.dart';
import 'domain/use_cases/get_news_list.dart';
import 'domain/use_cases/get_news_sources.dart';
import 'domain/use_cases/get_preferences_of_sources.dart';
import 'domain/use_cases/is_sources_selected.dart';
import 'domain/use_cases/persist_sources_selection.dart';
import 'presentation/bloc/auth/auth_cubit.dart';
import 'presentation/bloc/news_list/news_list_cubit.dart';
import 'presentation/bloc/news_source/news_source_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  //* Blocs
  di.registerFactory(
    () => NewsSourceCubit(
      getNewsSources: di(),
      persistSourcesSelection: di(),
    ),
  );

  di.registerFactory(() => AuthCubit(di()));

  di.registerFactory(() => NewsListCubit(getNewsList: di()));

  //* Use cases
  di.registerLazySingleton(() => GetNewsSources(di()));
  di.registerLazySingleton(() => PersistSourcesSelection(di()));
  di.registerLazySingleton(() => GetPreferencesOfSources(di()));
  di.registerLazySingleton(() => IsSourcesSelected(di()));
  di.registerLazySingleton(() => GetNewsList(di()));

  //* Repositories
  di.registerLazySingleton<NewsSourceRepository>(
    () => NewsSourceRepositoryImpl(di()),
  );

  di.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(di()),
  );

  di.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      newsRemoteDataSource: di(),
      preferencesDataSource: di(),
    ),
  );

  //* Data sources
  di.registerLazySingleton<NewsSourceDataSource>(
    () => NewsSourceDataSourceImpl(),
  );

  di.registerLazySingleton<PreferencesDataSource>(
    () => PreferencesDataSourceImpl(di()),
  );

  di.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(di()),
  );

  //* Core

  //* External
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
  di.registerLazySingleton(() => http.Client());
}
