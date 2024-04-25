part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class StartAuth extends AuthEvent {
  final String email;
  final String password;
  final bool isLogin;

  StartAuth(this.email, this.password, this.isLogin);
}

final class ResetAuth extends AuthEvent {}

final class ChangedEmail extends AuthEvent {
  final String? email;
  final String? passwordError;
  final String? confirmPasswordError;

  ChangedEmail(this.email, this.passwordError, this.confirmPasswordError);

}

final class ChangedPassword extends AuthEvent {
  final String? password;
  final String? emailError;
  final String? confirmPasswordError;

  ChangedPassword(this.password, this.emailError, this.confirmPasswordError);
}

final class ChangedConfirmPassword extends AuthEvent {
  final String? confirmPassword;
  final String? password;
  final String? emailError;
  final String? passwordError;

  ChangedConfirmPassword(this.confirmPassword, this.password, this.emailError, this.passwordError);
}

class SendResetEmail extends AuthEvent {
  final String? email;

  SendResetEmail({this.email});
}
