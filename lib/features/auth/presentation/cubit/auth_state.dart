part of 'auth_cubit.dart';

/// Auth State Class
@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Auth State Initial Class
class AuthInitial extends AuthState {}

/// AuthenticatingState
class AuthenticatingState extends AuthState {}

/// Authentication Success State
class AuthSuccessState extends AuthState {
  /// Public Auth Success state
}

/// Auth Faliure state
class AuthFaliureState extends AuthState {
  ///
  AuthFaliureState({required this.message});
  /// Auth Faliure message
  final String message;
  @override
  List<Object?> get props => [message];

}
