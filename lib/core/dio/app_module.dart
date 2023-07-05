import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:traffic/core/constants/api_constants.dart';
import 'package:traffic/core/dio/network_inteceptor.dart';

// /// cache options
// final options = CacheOptions(
//   store: MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576),
//   hitCacheOnErrorExcept: [401, 403, 404],
//   maxStale: const Duration(days: 1),
// );

/// App module
@module
abstract class AppModule {
  /// Dio instance
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          // ignore: avoid_redundant_argument_values
          baseUrl: ApiConstant.baseUrl,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          receiveDataWhenStatusError: true,
        ),
      )..interceptors.addAll([
          // DioCacheInterceptor(options: options),
          NetworkInterceptor(),
          if (kDebugMode)
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
            ),
        ]);
}
