
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart'; // Импорт здесь
import 'package:flutter_application_1/app/features/favorites/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _favoritesRepository;

  FavoritesBloc(this._favoritesRepository) : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  void _onLoadFavorites(LoadFavorites event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadInProgress());
    try {
      final favorites = await _favoritesRepository.getFavorites();
      emit(FavoritesLoadSuccess(favorites));
    } catch (e) {
      emit(FavoritesLoadFailure(e.toString()));
    }
  }

  void _onAddFavorite(AddFavorite event, Emitter<FavoritesState> emit) async {
    try {
      await _favoritesRepository.addFavorite(event.article);
      final favorites = await _favoritesRepository.getFavorites();
      emit(FavoritesLoadSuccess(favorites));
    } catch (e) {
      emit(FavoritesLoadFailure(e.toString()));
    }
  }

  void _onRemoveFavorite(RemoveFavorite event, Emitter<FavoritesState> emit) async {
    try {
      await _favoritesRepository.removeFavorite(event.articleId); // Передаем ID статьи
      final favorites = await _favoritesRepository.getFavorites();
      emit(FavoritesLoadSuccess(favorites));
    } catch (e) {
      emit(FavoritesLoadFailure(e.toString()));
    }
  }
}