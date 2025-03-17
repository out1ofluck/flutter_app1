import 'dart:async';
import 'package:flutter_application_1/domain/repository/model/article.dart';

abstract class TopNewsRepositoryIterface {
  Future<List<Article>> getTopNews();
}
