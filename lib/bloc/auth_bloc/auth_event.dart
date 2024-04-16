part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class StartAuth extends AuthEvent {
  final String email;
  final String password;
  final bool isLogin;

  StartAuth(this.email, this.password, this.isLogin);
}

final class ValidateAuth extends AuthEvent{
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool isLogin;

  ValidateAuth({this.email, this.password, this.confirmPassword, required this.isLogin});
}

final class ResetAuth extends AuthEvent {}