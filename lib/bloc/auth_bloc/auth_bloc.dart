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
    on<ChangedConfirmPassword>(_validateConfirmPassword);
    on<SendResetEmail>(_sendForgotPasswordEmail);
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
    String? passwordError;
    if (!_isPasswordValid(event.password)) {
      passwordError = t.password_error;
    }
    if (event.emailError != null ||
        passwordError != null ||
        event.confirmPasswordError != null) {
      emit(AuthValidationFailure(
          emailError: event.emailError,
          passwordError: passwordError,
          confirmPasswordError: event.confirmPasswordError));
    } else {
      emit(AuthValidationSuccess());
    }
  }

  void _validateConfirmPassword(ChangedConfirmPassword event, Emitter<AuthState> emit) {
    String? confirmPasswordError;
    if (!_isConfirmPasswordValid(event.password, event.confirmPassword)) {
      confirmPasswordError = t.confirm_password_error;
    }
    if (event.emailError != null ||
        event.passwordError != null ||
        confirmPasswordError != null) {
      emit(AuthValidationFailure(
          emailError: event.emailError,
          passwordError: event.passwordError,
          confirmPasswordError: confirmPasswordError));
    } else {
      emit(AuthValidationSuccess());
    }
  }

  void _reset(ResetAuth event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  void _authenticate(StartAuth event, Emitter<AuthState> emit) async {
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
}
