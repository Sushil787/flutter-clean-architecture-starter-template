import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traffic/core/constants/api_constants.dart';
import 'package:traffic/core/constants/app_constants.dart';
import 'package:traffic/core/constants/app_route.dart';
import 'package:traffic/core/routes/app_router.dart';
import 'package:traffic/di/di_setup.dart';

/// Network interceptor class
class NetworkInterceptor extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = getIt<SharedPreferences>().getString(AppConstants.tokenKey);
    if (token != null && token.isNotEmpty ) {
      options.headers['Authorization'] = token;
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final path = err.requestOptions.path;
    if (err.response?.statusCode == 401 && path != ApiConstant.signinEndPoint) {
      {
        final prefs = getIt<SharedPreferences>();
        await prefs.remove(AppConstants.tokenKey);
        final router = getIt<AppRouter>();
        await router.router.pushReplacement(AppRoute.loginRoute);
      }
    } else {
      handler.next(err);
    }
  }
}
