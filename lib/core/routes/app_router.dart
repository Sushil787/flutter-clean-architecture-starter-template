import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/core/components/splash_screen.dart';
import 'package:starter/core/constants/app_constants.dart';
import 'package:starter/core/constants/app_route.dart';
import 'package:starter/di/di_setup.dart';
import 'package:starter/features/auth/presentation/login_screen.dart';
import 'package:starter/features/home/test_homepage.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Go router instance
@injectable
class AppRouter {
  final GoRouter _goRouter = GoRouter(
    initialLocation: AppRoute.loginRoute,
    // redirect: (context, state) async {
    //   /// Sharedpref token
    //   final token = getIt<SharedPreferences>().getString(AppConstants.tokenKey);
    //   if (token != null) {
    //     log(token);
    //     return AppRoute.homeRoute;
    //   }

    //   return AppRoute.loginRoute;
    // },
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoute.homeRoute,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoute.loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoute.splashRoute,
        builder: (context, state) => const SplashScreen(),
      )
    ],
  );

  /// Router
  GoRouter get router => _goRouter;
}
