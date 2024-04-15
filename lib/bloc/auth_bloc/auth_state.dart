part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable{}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

abstract class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class AuthUnknownFailure extends AuthFailure {
  AuthUnknownFailure(super.errorMessage);
}

final class AuthCredentialsFailure extends AuthFailure {
  AuthCredentialsFailure(super.errorMessage);
}

final class AuthValidationFailure extends AuthState{
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  AuthValidationFailure({this.emailError, this.passwordError, this.confirmPasswordError});

  @override
  List<Object?> get props => [emailError, passwordError, confirmPasswordError];

}

final class AuthValidationSuccess extends AuthState {
  @override
  List<Object> get props => [];
}


