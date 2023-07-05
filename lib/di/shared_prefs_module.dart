import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Singleton Shared preferences class
@module
abstract class SharedPrefsInjectionModule {
  /// preresolve shared preferences
  @preResolve
  Future<SharedPreferences> get prefs async => SharedPreferences.getInstance();
}
