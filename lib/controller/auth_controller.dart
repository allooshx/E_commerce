import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;

  AuthController({required this.auth, this.email = '', this.password = ''});

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  Future<void> submit() async {
    try {
      await auth.loginWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signup() async {
    try {
      await auth.signupWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
  void copyWith({String? email, String? password}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    notifyListeners();
  }
}
