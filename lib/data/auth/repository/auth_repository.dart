import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> deleteAccount(User user) async {
    return _authDataProvider.deleteAccount(user);
  }

  Future<void> reauthenticate(User user, String password) async {
    return _authDataProvider.reauthenticate(user, password);
  }
}
