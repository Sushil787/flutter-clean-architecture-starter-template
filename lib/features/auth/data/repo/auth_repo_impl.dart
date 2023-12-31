import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:starter/features/auth/data/service/auth_service.dart';
import 'package:starter/features/auth/domain/auth_repo.dart';

/// Auth Repo Impl
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  ///Public Constructor
  AuthRepoImpl(this._authService);
  final AuthService _authService;
  @override
  Future<Either<String, Response<dynamic>>> login(
    Map<String, dynamic> data,
  ) async {
    final response = await _authService.login(data);

    return response;
  }

  @override
  Future<Either<String, Response<dynamic>>> register(
    Map<String, dynamic> data,
  ) {
    throw UnimplementedError();
  }
}
