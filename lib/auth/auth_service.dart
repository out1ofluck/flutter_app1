import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Ошибка регистрации";
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Ошибка входа";
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Ошибка выхода";
    }
  }
}