import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/config/app_config.dart';
import 'package:starter/core/routes/app_router.dart';
import 'package:starter/core/theme/app_theme.dart';
import 'package:starter/core/theme/theme_cubit.dart';
import 'package:starter/di/di_setup.dart';
import 'package:starter/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:starter/observer.dart';


/// Navigator key
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  const isProd = AppEnvironmentConfig.isProd;
  await configureDependencies(
    // ignore: avoid_redundant_argument_values
    env: isProd ? Environment.prod : Environment.dev,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => getIt<AuthCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

/// My app Widget
class MyApp extends StatefulWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  /// App router instance
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        log(state.toString());
        return MaterialApp.router(
          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode:
              state == ThemeState.dark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          key: navigatorKey,
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
