import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataProvider {
  final _firebase = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> login(String email, String password) {
    return _firebase.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> register(String email, String password) {
    return _firebase.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> resetPassword(String email) {
    return _firebase.sendPasswordResetEmail(email: email);
  }

  Future<void> deleteAccount(User user) async {
    await _firestore
        .collection('favorites')
        .doc(user.uid)
        .collection('libraries')
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.delete();
      }
    });
    await user.delete();
  }

  Future<void> reauthenticate(User user, String password) async {
    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: password,
    );
    await user.reauthenticateWithCredential(credential);
  }
}
