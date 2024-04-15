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

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class AuthEmailFailure extends AuthFailure {
  AuthEmailFailure(super.errorMessage);
}

final class AuthCredentialsFailure extends AuthFailure {
  AuthCredentialsFailure(super.errorMessage);
}
