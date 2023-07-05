// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../core/dio/app_module.dart' as _i13;
import '../core/dio/dio_client.dart' as _i5;
import '../core/dio/network_info.dart' as _i6;
import '../core/routes/app_router.dart' as _i3;
import '../features/auth/data/repo/auth_repo_impl.dart' as _i10;
import '../features/auth/data/service/auth_service.dart' as _i8;
import '../features/auth/domain/auth_repo.dart' as _i9;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i11;
import 'shared_prefs_module.dart' as _i12;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  final sharedPrefsInjectionModule = _$SharedPrefsInjectionModule();
  gh.factory<_i3.AppRouter>(() => _i3.AppRouter());
  gh.singleton<_i4.Dio>(appModule.dio);
  gh.factory<_i5.DioClient>(() => _i5.DioClient(gh<_i4.Dio>()));
  gh.factory<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl());
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => sharedPrefsInjectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i8.AuthService>(() => _i8.AuthService(gh<_i5.DioClient>()));
  gh.factory<_i9.AuthRepo>(() => _i10.AuthRepoImpl(gh<_i8.AuthService>()));
  gh.singleton<_i11.AuthCubit>(_i11.AuthCubit(
    gh<_i9.AuthRepo>(),
    gh<_i6.NetworkInfo>(),
  ));
  return getIt;
}

class _$SharedPrefsInjectionModule extends _i12.SharedPrefsInjectionModule {}

class _$AppModule extends _i13.AppModule {}
