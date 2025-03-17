import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/app/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_application_1/app/widgets/article_card.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<FavoritesBloc>()..add(LoadFavorites()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Избранное'),
        ),
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FavoritesLoadSuccess) {
              List<Article> favorites = state.favorites;
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return ArticleCard(
                    article: favorites[index],
                    showDeleteIcon: true, // Включаем иконку удаления
                  );
                },
              );
            }
            if (state is FavoritesLoadFailure) {
              return Center(child: Text('Ошибка: ${state.exception}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}