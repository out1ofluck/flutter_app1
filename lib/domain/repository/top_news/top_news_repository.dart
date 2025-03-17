import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
import 'package:flutter_application_1/domain/repository/top_news/top_news_repository_interface.dart';

class TopNewsRepository extends TopNewsRepositoryIterface {
  TopNewsRepository({required this.dio, required this.endpoint});

  final Dio dio;
  final String endpoint;

  @override
  Future<List<Article>> getTopNews() async {
    try {
      final Response response = await dio.get(endpoint);

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> articleList = response.data;
        final List<Article> articles = articleList.map((item) => Article.fromJson(item)).toList();
        return articles;
      } else {
        throw Exception('Failed to load top news: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw 'Dio error: ${e.message}';
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }
}