import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  FirebaseAuth _authService = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword(
    String email, 
    String password
  )
    async {
      try {
        UserCredential credential = await _authService.createUserWithEmailAndPassword(
          email: email,
          password: password
        );
        return credential.user;
      }
      catch(e) {
        print(e);
        return null;
      }
    }

    Future<User?> loginWithEmailandPassword(
      String email, 
      String password, 
      BuildContext context
    ) async {
      try {
        UserCredential credential = await _authService.signInWithEmailAndPassword(
          email: email,
          password: password
        );
        return credential.user;
      } catch (e) {
        final String errorMessage = e.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
}