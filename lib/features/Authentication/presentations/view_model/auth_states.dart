import 'package:wajba/core/errors/error_model.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class RegisteringAuthState extends AuthState {}

class RegisterSuccessfullyState extends AuthState {}

class LoginAuthState extends AuthState {}

class LoginSuccessfullyState extends AuthState {
  final String token;

  LoginSuccessfullyState({required this.token});
}

class LoggingOutState extends AuthState {}

class LoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  ErrorModel errorModel;

  AuthErrorState({required this.errorModel});
}
