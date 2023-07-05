// ignore_for_file: avoid_dynamic_calls

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/core/constants/app_constants.dart';
import 'package:starter/core/dio/network_info.dart';
import 'package:starter/di/di_setup.dart';
import 'package:starter/features/auth/domain/auth_repo.dart';

part 'auth_state.dart';

@singleton

/// Auth Cubit
class AuthCubit extends Cubit<AuthState> {
  /// Auth Cubit Constructor
  AuthCubit(this._repo, this._networkInfo) : super(AuthInitial());

  final AuthRepo _repo;
  final NetworkInfo _networkInfo;

  /// Shared pref instance
  final _pref = getIt<SharedPreferences>();

  /// Login
  Future<void> login(Map<String, dynamic> data) async {
    if (await _networkInfo.isConnected()) {
      emit(AuthenticatingState());
      final response = await _repo.login(data);
      emit(AuthenticatingState());
      log('authenticationg state');
      emit(
        response.fold(
          (message) {
            return AuthFaliureState(message: message);
          },
          (response) {
            _pref.setString(
              AppConstants.tokenKey,
              response.data['message'] as String,
            );
            log(
              name: 'auth token', response.data['message'] as String,
              // data.headers['authorization'] != null ? [0] as String : '',
            );
            return AuthSuccessState();
          },
        ),
      );
    } else {
      emit(AuthFaliureState(message: 'No internet'));
    }
  }
  //   response.fold((message) {
  //     emit(AuthFaliureState(message: message));
  //   }, (data) {
  //     _pref.setString(
  //       AppConstants.tokenKey,
  //       data.data['message'] as String,
  //     );
  //     log(
  //       name: 'auth token', data.data['message'] as String,
  //       // data.headers['authorization'] != null ? [0] as String : '',
  //     );
  //     emit(AuthSuccessState());
  //   });
  // }
}
