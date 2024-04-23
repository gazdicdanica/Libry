import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_internship_2024_app/data/auth/data_provider/auth_data_provider.dart';

class AuthRepository {
  final AuthDataProvider _authDataProvider;

  AuthRepository(this._authDataProvider);

  Future<void> login(String email, String password) async {
    return _authDataProvider.login(email, password);
  }

  Future<void> register(String email, String password) async {
    return _authDataProvider.register(email, password);
  }

  Future<void> resetPassword(String email) async {
    return _authDataProvider.resetPassword(email);
  }

  void deleteAccount(DeleteAccount event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authDataProvider.deleteAccount(event.user);
      emit(AccountDeleted());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        emit(ReauthenticationNeeded());
      } else {
        emit(AuthDeletionFailure(e.toString()));
      }
    } catch (e) {
      emit(AuthDeletionFailure(e.toString()));
    }
  }

  Future<void> reauthenticate(User user, String password) async {
    return _authDataProvider.reauthenticate(user, password);
  }
}
