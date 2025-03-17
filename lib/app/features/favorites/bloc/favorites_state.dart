part of 'favorites_bloc.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadInProgress extends FavoritesState {}

class FavoritesLoadSuccess extends FavoritesState {
  final List<Article> favorites;
  FavoritesLoadSuccess(this.favorites);
}

class FavoritesLoadFailure extends FavoritesState {
  final String exception;
  FavoritesLoadFailure(this.exception);
}