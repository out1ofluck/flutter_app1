import 'package:firebase_core/firebase_core.dart'; // Импортируйте firebase_core
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/app/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_application_1/app/features/favorites/favorites_repository.dart';
import 'package:flutter_application_1/app/features/home/article.dart';
import 'package:flutter_application_1/app/features/home/home_screen.dart';
import 'package:flutter_application_1/auth/auth_bloc.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:flutter_application_1/di/di.dart';
import 'package:flutter_application_1/screens/article_detail_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart'; // Импортируем Article

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/home/article',
          builder: (context, state) {
            final article = state.extra as Article;
            return BlocProvider.value(
              value: context.read<FavoritesBloc>(),
              child: ArticleScreen(article: article),
            );
          },
        ),
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
      ],
      initialLocation: '/login',
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthService()),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(getIt<FavoritesRepository>()),
        ),
      ],
      child: MaterialApp.router(
        title: 'News Brief',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _router,
      ),
    );
  }
}