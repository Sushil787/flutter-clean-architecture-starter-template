/// App config
class AppEnvironmentConfig {
  /// Check env 
  // ignore: avoid_redundant_argument_values
  static const isProd = bool.fromEnvironment('isProd', defaultValue: false);
}
