import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/core/dio/dio_exception.dart';

/// Request Type enum
enum RequestType {
  /// get
  get,

  /// post
  post,

  /// delete
  delete,

  /// patch
  patch
}

@injectable

/// Dio Client
class DioClient {
  /// Dio client constructor
  DioClient(this._dio);
  final Dio _dio;

  /// Response
  late Response<dynamic> response;

  /// Dio request method
  Future<Either<String, Response<dynamic>>> request({
    required RequestType requestType,
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      switch (requestType) {
        case RequestType.get:
          response = await _dio.get(
            data: data,
            path,
          );
          return right(response);
        case RequestType.post:
          response = await _dio.post(
            data: data,
            path,
          );
          return right(response);
        case RequestType.patch:
          response = await _dio.patch(
            data: data,
            path,
          );
          return right(response);
        case RequestType.delete:
          response = await _dio.get(
            data: data,
            path,
          );
          return right(response);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      return left(error);
    } catch (e) {
      final error = Exception(e).toString();
      return left(error);
    }
  }
}
