
# Flutter Clean Architecture Starter Template

This is a Flutter project starter template that follows the principles of Clean Architecture. It provides a structured and scalable architecture for building Flutter applications.

## Package Usage

To use this package, follow the steps below:

1. Clone the repository by running the following command:
```bash
git clone https://github.com/Sushil787/flutter-clean-architecture-starter-template.git 
```

2. Fetch the required dependencies by running the command:
```bash
flutter pub get
```

3. Run the build_runner command to generate the necessary files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```


4. You're all set! Now you can start developing your Flutter application using the Clean Architecture approach.

## Dependencies

The following dependencies are included in this Flutter starter template:

- `dio: ^5.0.3`: A powerful HTTP client for Dart, used for making API requests.
- `get_it: ^7.2.0`: A service locator for dependency injection.
- `injectable: ^2.1.1`: A dependency injection library for Flutter.
- `flutter_bloc: ^8.1.2`: A predictable state management library for Flutter.
- `secure_shared_preferences: ^0.0.4`: A secure storage solution for sensitive data using the shared_preferences package.
- `cached_network_image: ^3.2.3`: A Flutter library for loading and caching network images.
- `pretty_dio_logger: ^1.3.1`: A Dio interceptor that logs HTTP requests and responses in a readable format.
- `dio_cache_interceptor: ^3.4.0`: A Dio interceptor that provides cache mechanisms for HTTP requests.
- `json_serializable: ^6.6.0`: A code generation library for creating JSON serialization and deserialization code.
- `json_annotation: ^4.8.0`: Annotations for the json_serializable package.
- `freezed_annotation: ^2.2.0`: Annotations for the freezed package.
- `dartz: ^0.10.1`: A functional programming library for Dart.
- `go_router: ^8.2.0`: A declarative, code-first router for Flutter applications.
- `shared_preferences: ^2.0.20`: A Flutter plugin for reading and writing simple key-value pairs.
- `shimmer: ^2.0.0`: A Flutter library for creating shimmering effects.
- `easy_localization: ^3.0.2`: A Flutter localization library that simplifies the process of internationalizing Flutter apps.
- `google_fonts: ^4.0.4`: A Flutter library for using custom Google Fonts.
- `equatable: ^2.0.5`: A Dart package for comparing objects for equality in a simplified manner.
- `connectivity_plus: ^4.0.1`: A Flutter plugin for determining connectivity status.

Please refer to the official documentation of each dependency for more information on their usage and configuration.

**Note:** Uncomment the relevant sections in the `pubspec.yaml` file to include additional dependencies or development packages as needed.

## Development Dependencies

The following development dependencies are included in this Flutter starter template:

- `build_runner: ^2.3.3`: A build system for generating Dart code.
- `flutter_lints: ^2.0.0`: A set of recommended lints for encouraging good coding practices.
- `freezed: ^2.3.2`: A code generation library for immutable classes.
- `injectable_generator: ^2.1.4`: Code generation for the injectable package.
- `very_good_analysis: ^4.0.0+1`: A set
