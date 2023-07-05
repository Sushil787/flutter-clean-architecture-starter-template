import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/core/constants/app_constants.dart';
import 'package:starter/core/constants/app_media.dart';
import 'package:starter/core/constants/app_route.dart';
import 'package:starter/core/utils/gap.dart';
import 'package:starter/di/di_setup.dart';

/// Splash Screen
class SplashScreen extends StatefulWidget {
  // ignore: public_member_api_docs
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final token = getIt<SharedPreferences>().getString(AppConstants.tokenKey);
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      token != null
          ? context.go(AppRoute.homeRoute)
          : context.go(AppRoute.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppMedia.splashImage,
          ),
          VerticalGap.s,
          Text(
            'starter dai'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
          )
        ],
      ),
    );
  }
}
