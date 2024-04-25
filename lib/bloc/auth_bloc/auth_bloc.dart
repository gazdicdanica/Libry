
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/data/auth/repository/auth_repository.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<StartAuth>(_authenticate);
    on<ResetAuth>(_reset);
    on<ChangedEmail>(_validateEmail);
    on<ChangedPassword>(_validatePassword);
    on<SendResetEmail>(_sendForgotPasswordEmail);
    on<DeleteAccount>(_deleteAccount);
    on<Reauthenticate>(_reauthenticate);
  }

  bool _isEmailValid(String? email) =>
      email != null &&
      email.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

  bool _isPasswordValid(String? password) =>
      password != null && password.isNotEmpty && password.length >= 6;

  bool _isConfirmPasswordValid(String? password, String? confirmPassword) =>
      confirmPassword != null &&
      confirmPassword.isNotEmpty &&
      confirmPassword == password;

  void _validateEmail(ChangedEmail event, Emitter<AuthState> emit) {
    String? emailError;
    if (!_isEmailValid(event.email)) {
      emailError = t.email_format_error;
    }
    if (emailError != null ||
        event.passwordError != null ||
        event.confirmPasswordError != null) {
      emit(AuthValidationFailure(
          emailError: emailError,
          passwordError: event.passwordError,
          confirmPasswordError: event.confirmPasswordError));
    } else {
      emit(AuthValidationSuccess());
    }
  }

  void _validatePassword(ChangedPassword event, Emitter<AuthState> emit) {
    String? confirmPasswordError;
    String? passwordError;
    if (!_isPasswordValid(event.password)) {
      passwordError = t.password_error;
    }
    if (!event.isLogin) {
      if (!_isConfirmPasswordValid(event.password, event.confirmPassword)) {
        confirmPasswordError = t.confirm_password_error;
      }
    }
    if (event.emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      emit(AuthValidationFailure(
          emailError: event.emailError,
          passwordError: passwordError,
          confirmPasswordError: confirmPasswordError));
    } else {
      emit(AuthValidationSuccess());
    }
  }

  void _reset(ResetAuth event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  bool _validate(StartAuth event, Emitter<AuthState> emit){
    String? emailError;
    String? passwordError;
    String? confirmPasswordError;

    if (!_isEmailValid(event.email)) {
      emailError = t.email_format_error;
    }
    if (!_isPasswordValid(event.password)) {
      passwordError = t.password_error;
    }
    if (!event.isLogin) {
      if (!_isConfirmPasswordValid(event.password, event.confirmPassword)) {
        confirmPasswordError = t.confirm_password_error;
      }
    }
    if (emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      emit(AuthValidationFailure(
          emailError: emailError,
          passwordError: passwordError,
          confirmPasswordError: confirmPasswordError));
      return false;
    }
    return true;
  }

  void _authenticate(StartAuth event, Emitter<AuthState> emit) async {
    if(!_validate(event, emit)) return;
    emit(AuthLoading());
    try {
      if (!event.isLogin) {
        await _authRepository.register(event.email, event.password);
        emit(AuthSuccess());
      } else {
        await _authRepository.login(event.email, event.password);
        emit(AuthSuccess());
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          emit(AuthValidationFailure(emailError: t.email_already_in_use));
          break;
        case 'invalid-credential':
        case 'too-many-requests':
          emit(AuthCredentialsFailure(t.invalid_credential));
          break;
        default:
          emit(AuthUnknownFailure(t.auth_failed));
          break;
      }
    } catch (e) {
      emit(AuthUnknownFailure(t.auth_failed));
    }
  }

  void _sendForgotPasswordEmail(
      SendResetEmail event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.resetPassword(event.email!);
      emit(ForgotPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgotPasswordFailure(emailError: e.message));
    }
  }

  void _deleteAccount(DeleteAccount event, Emitter<AuthState> emit) async {
    emit(DeleteLoading());
    try {
      await _authRepository.deleteAccount(event.user);
      emit(AuthDeletionSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'requires-recent-login':
          emit(ReauthenticationNeeded());
          break;
        case 'network-request-failed':
          emit(AuthDeletionFailure(t.internet_error));
          break;
        default:
          emit(AuthDeletionFailure(t.delete_account_error));
          break;
      }
    } catch (e) {
      emit(AuthDeletionFailure(t.delete_account_error));
    }
  }

  void _reauthenticate(Reauthenticate event, Emitter<AuthState> emit) async {
    emit(ReauthLoading());
    try {
      await _authRepository.reauthenticate(event.user, event.password);
      emit(ReauthenticationSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          emit(ReauthenticationFailure(t.wrong_password));
          break;
        case 'network-request-failed':
          emit(ReauthenticationFailure(t.internet_error));
          break;
        case 'too-many-requests':
          emit(ReauthenticationFailure(t.too_many_requests));
          break;
        default:
          emit(ReauthenticationFailure(t.reauth_account_error));
          break;
      }
    } catch (e) {
      emit(ReauthenticationFailure(t.reauth_account_error));
    }
  }
}
