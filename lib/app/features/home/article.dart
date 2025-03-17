import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/app/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали статьи'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Добавляем статью в избранное
              context.read<FavoritesBloc>().add(AddFavorite(article));
              // Показываем уведомление
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Статья добавлена в избранное')),
              );
            },
          ),
          IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop(); // Вернуться на предыдущий экран
            } else {
              context.go('/home'); // Если нельзя pop, переходим на главный экран
            }
          },
        ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.media_type == 'image' && article.url != null)
              Image.network(
                article.url!,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            Text(
              article.title ?? 'Без названия',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              article.explanation ?? 'Без описания',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}