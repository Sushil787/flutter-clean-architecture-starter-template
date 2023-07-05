import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/core/constants/api_constants.dart';
import 'package:starter/core/dio/dio_client.dart';


///Auth Service class
@injectable
class AuthService {
  ///Public Constructor
  AuthService(this._dioClient);

  /// Dio Client
  final DioClient _dioClient;

  /// Login Service
  Future<Either<String, Response<dynamic>>> login(
    Map<String, dynamic> data,
  ) async {
    final response = await _dioClient.request(
      requestType: RequestType.post,
      path: ApiConstant.signinEndPoint,
      data: data,
    );
    return response;
  }
}
