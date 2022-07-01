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
import 'domain/use_cases/change_locale.dart';
import 'domain/use_cases/change_theme_mode.dart';
import 'domain/use_cases/get_default_locale.dart';
import 'domain/use_cases/get_default_theme_mode.dart';
import 'domain/use_cases/get_news_list.dart';
import 'domain/use_cases/get_news_sources.dart';
import 'presentation/bloc/localization/localization_cubit.dart';
import 'presentation/bloc/news_list/news_list_cubit.dart';
import 'presentation/bloc/theme/theme_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  //* Blocs
  di.registerFactory(() => NewsListCubit(getNewsList: di()));

  di.registerFactory(
    () => LocalizationCubit(
      getDefaultLocale: di(),
      changeLocale: di(),
    ),
  );

  di.registerFactory(
    () => ThemeCubit(
      getDefaultThemeMode: di(),
      changeThemeMode: di(),
    ),
  );

  //* Use cases
  di.registerLazySingleton(() => GetNewsSources(di()));
  di.registerLazySingleton(() => GetNewsList(di()));
  di.registerLazySingleton(() => GetDefaultLocale(di()));
  di.registerLazySingleton(() => ChangeLocale(di()));
  di.registerLazySingleton(() => GetDefaultThemeMode(di()));
  di.registerLazySingleton(() => ChangeThemeMode(di()));

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
      newsSourceDataSource: di(),
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
