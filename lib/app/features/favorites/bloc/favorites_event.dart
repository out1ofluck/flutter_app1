part of 'favorites_bloc.dart';



abstract class FavoritesEvent {}

class LoadFavorites extends FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final Article article;
  AddFavorite(this.article);
}

class RemoveFavorite extends FavoritesEvent {
  final String articleId; // Используем ID статьи вместо объекта Article
  RemoveFavorite(this.articleId);
}