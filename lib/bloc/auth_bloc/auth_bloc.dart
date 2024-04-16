import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/i18n/strings.g.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<StartAuth>(_authenticate);
    on<ResetAuth>(_reset);
    on<ValidateAuth>(_validate);
    on<SendResetEmail>(_validateForgotPassword);
  }

  final _firebase = FirebaseAuth.instance;

  void _validate(ValidateAuth event, Emitter<AuthState> emit) {
    String? emailError;
    String? passwordError;
    String? confirmPasswordError;
    if (event.email == null || event.email!.isEmpty ||!EmailValidator.validate(event.email!)) {
      emailError = t.email_format_error;
    } 
    if(event.password == null || event.password!.isEmpty || event.password!.length < 6){
      passwordError = t.password_error;
    }
    if(!event.isLogin){
      if(event.confirmPassword == null || event.confirmPassword!.isEmpty || event.confirmPassword != event.password){
        confirmPasswordError = t.confirm_password_error;
      }
    }
    if(emailError != null || passwordError != null || confirmPasswordError != null){
      emit(AuthValidationFailure(emailError: emailError, passwordError: passwordError, confirmPasswordError: confirmPasswordError));
    } else {
      add(StartAuth(event.email!, event.password!, event.isLogin));
    }
  }

  void _reset(ResetAuth event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  void _authenticate(StartAuth event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (!event.isLogin) {
        await _firebase.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AuthSuccess());
      } else {
        await _firebase.signInWithEmailAndPassword(
            email: event.email, password: event.password);
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

void _validateForgotPassword(SendResetEmail event, Emitter<AuthState> emit) async {
  try {
    await _firebase.sendPasswordResetEmail(email: event.email!);
    emit(ForgotPasswordSuccess());
  } on FirebaseAuthException catch (e) {
    emit(ForgotPasswordFailure(emailError: e.message));
  }
}
}

