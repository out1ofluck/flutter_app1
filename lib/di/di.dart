import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/app/features/favorites/bloc/favorites_bloc.dart'; // Используем только этот путь
import 'package:flutter_application_1/app/features/favorites/favorites_repository.dart';
import 'package:flutter_application_1/app/features/home/bloc/home_bloc.dart';
import 'package:flutter_application_1/data/dio/set_up.dart';
import 'package:flutter_application_1/domain/repository/top_news/top_news_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;
final Dio dio = Dio();
final talker = TalkerFlutter.init();

Future<void> setupLocator() async {
  getIt.registerSingleton(talker);
  setUpDio();

  // Регистрация репозиториев
  getIt.registerSingleton(TopNewsRepository(dio: getIt<Dio>(), endpoint: ''));
  getIt.registerSingleton(FavoritesRepository());

  // Регистрация BLoC
  getIt.registerFactory(() => HomeBloc(getIt.get<TopNewsRepository>()));
  getIt.registerSingleton(FavoritesBloc(getIt.get<FavoritesRepository>()));
}