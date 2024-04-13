import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<StartAuth>(_authenticate);
    on<ResetAuth>(_reset);
  }

  final _firebase = FirebaseAuth.instance;

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
          emit(AuthEmailFailure('Email is already in use!'));
          break;
        case 'invalid-credential':
        case 'too-many-requests':
          emit(AuthCredentialsFailure('Invalid email or password!'));
          break;
        default:
          emit(AuthFailure('Authentication failed! Please try again later!'));
          break;
      }
    } catch (e) {
      emit(AuthFailure('Authentication failed! Please try again later!'));
    }
  }
}
