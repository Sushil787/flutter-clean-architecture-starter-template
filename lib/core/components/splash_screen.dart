import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traffic/core/constants/app_constants.dart';
import 'package:traffic/core/constants/app_media.dart';
import 'package:traffic/core/constants/app_route.dart';
import 'package:traffic/core/utils/gap.dart';
import 'package:traffic/di/di_setup.dart';

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
            'Traffic dai'.toUpperCase(),
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
