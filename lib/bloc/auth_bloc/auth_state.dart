part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}

final class AuthEmailFailure extends AuthFailure {
  AuthEmailFailure(super.errorMessage);
}

final class AuthCredentialsFailure extends AuthFailure {
  AuthCredentialsFailure(super.errorMessage);
}
