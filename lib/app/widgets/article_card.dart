import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/app/features/favorites/bloc/favorites_bloc.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key, 
    required this.article,
    this.showDeleteIcon = false, // Новый параметр
  });

  final Article article;
  final bool showDeleteIcon; // По умолчанию false

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/home/article', extra: article); // Передача Article через extra
      },
      borderRadius: BorderRadius.circular(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.media_type == 'image') 
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                article.url ?? '',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? 'No Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  article.explanation ?? 'No Description',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (showDeleteIcon) // Иконка удаления, если showDeleteIcon == true
            IconButton(
  icon: const Icon(Icons.delete, color: Colors.red),
  onPressed: () {
    print("Нажата кнопка удаления для статьи: ${article.id}");
    context.read<FavoritesBloc>().add(RemoveFavorite(article.id)); // Передаем ID статьи
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Статья удалена из избранного')),
    );
  },
),
        ],
      ),
    );
  }
}