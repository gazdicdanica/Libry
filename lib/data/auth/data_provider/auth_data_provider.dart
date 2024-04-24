import 'package:firebase_auth/firebase_auth.dart';

class AuthDataProvider{

  final _firebase = FirebaseAuth.instance;

  Future<void> login(String email, String password){
    return _firebase.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register(String email, String password){
    return _firebase.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> resetPassword(String email){
    return _firebase.sendPasswordResetEmail(email: email);
  }
}