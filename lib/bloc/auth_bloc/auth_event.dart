part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class StartAuth extends AuthEvent {
  final String email;
  final String password;
  final String? confirmPassword;
  final bool isLogin;

  StartAuth(this.email, this.password, this.confirmPassword, this.isLogin);
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
  final String? confirmPassword;
  final bool isLogin;

  ChangedPassword(this.password, this.confirmPassword, this.emailError, this.isLogin);
}

class SendResetEmail extends AuthEvent {
  final String? email;

  SendResetEmail({this.email});
}

final class DeleteAccount extends AuthEvent {
  final User user;

  DeleteAccount(this.user);
}

final class Reauthenticate extends AuthEvent {
  final User user;
  final String password;

  Reauthenticate(this.user, this.password);
}
