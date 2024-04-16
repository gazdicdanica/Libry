import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<StartAuth>(_authenticate);
    on<ResetAuth>(_reset);
    on<ValidateAuth>(_validate);
  }

  final _firebase = FirebaseAuth.instance;

  void _validate(ValidateAuth event, Emitter<AuthState> emit) {
    String? emailError;
    String? passwordError;
    String? confirmPasswordError;
    if (event.email == null || event.email!.isEmpty ||!EmailValidator.validate(event.email!)) {
      emailError = 'Email is not in correct format!';
    } 
    if(event.password == null || event.password!.isEmpty || event.password!.length < 6){
      passwordError = 'Password should contain 6 characters!';
    }
    if(!event.isLogin){
      if(event.confirmPassword == null || event.confirmPassword!.isEmpty || event.confirmPassword != event.password){
        confirmPasswordError = 'Passwords do not match!';
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
          emit(AuthValidationFailure(emailError: 'Email is already in use!'));
          break;
        case 'invalid-credential':
        case 'too-many-requests':
          emit(AuthCredentialsFailure('Invalid email or password!'));
          break;
        default:
          emit(AuthUnknownFailure('Authentication failed! Please try again later!'));
          break;
      }
    } catch (e) {
      emit(AuthUnknownFailure('Authentication failed! Please try again later!'));
    }
  }
}
