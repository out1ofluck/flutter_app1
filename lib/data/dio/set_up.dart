import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:flutter_application_1/di/di.dart';
import 'package:dio/dio.dart';
void setUpDio() {
  dio.options.baseUrl = 'https://api.nasa.gov/planetary/apod';
  dio.options.queryParameters.clear(); // Очищаем любые ранее добавленные параметры
  dio.options.queryParameters['api_key'] = 'Wjjr2PrI7b5QGeK1vMm0a1tjil1q62XdGDIFpblS'; 
  dio.options.queryParameters['count'] = '10';
  // Добавьте другие допустимые параметры при необходимости
  dio.options.connectTimeout = const Duration(minutes: 1);
  dio.options.receiveTimeout = const Duration(minutes: 1);
  
  dio.interceptors.addAll([
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
      ),
    ),
  ]);
  
  getIt.registerSingleton<Dio>(dio); // Регистрируем Dio в GetIt
}

