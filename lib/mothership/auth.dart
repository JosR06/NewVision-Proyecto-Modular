// ignore_for_file: unused_import, file_names

import 'package:firebase_auth/firebase_auth.dart';

class Auth{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();


  //sign in with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //register with email and password
  Future<void> createUserWithEmailAndPassword(
      {required String email, 
      required String password
      }) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

   

}