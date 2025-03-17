import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/features/home/article.dart';
import 'package:flutter_application_1/app/features/home/home_screen.dart';
import 'package:flutter_application_1/di/di.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  observers: [TalkerRouteObserver(talker)],
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
      // для следующей лабораторной работы
      routes: [
        GoRoute(
          path: 'article',
          builder: (context, state) {
            // Передача аргумента на экран статьи
            final Article article = state.extra as Article;
            return ArticleScreen(article: article);
          },
        ),
      ],
    ),
  ],
);
