import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';

class FavoritesRepository {
  final CollectionReference _favoritesCollection =
      FirebaseFirestore.instance.collection('favorites');

  Future<List<Article>> getFavorites() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await _favoritesCollection.doc(userId).collection('items').get();
   return snapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Article.fromJson(data); // Убедитесь, что ID сохраняется
  }).toList();
  }

 Future<void> addFavorite(Article article) async {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  print("Добавление статьи с ID: ${article.id} для пользователя: $userId");
  await _favoritesCollection
      .doc(userId)
      .collection('items')
      .doc(article.id)
      .set(article.toJson());
  print("Статья успешно добавлена");
}

Future<void> removeFavorite(String articleId) async {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  print("Удаление статьи с ID: $articleId для пользователя: $userId");
  await _favoritesCollection
      .doc(userId)
      .collection('items')
      .doc(articleId) // Используем ID из Firebase
      .delete();
  print("Статья успешно удалена");
}
}
