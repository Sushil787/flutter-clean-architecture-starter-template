import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// Auth Repo class
abstract class AuthRepo {
  /// Login Method
  Future<Either<String, Response<dynamic>>> login(
    Map<String, dynamic> data,
  );

  /// Register Method
  Future<Either<String, Response<dynamic>>> register(
    Map<String, dynamic> data,
  );
}
