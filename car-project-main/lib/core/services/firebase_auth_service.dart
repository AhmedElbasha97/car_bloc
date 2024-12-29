import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exception.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The email address is already in use by another account.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'please check your internet connection.');
      } else {
        throw CustomException(
            message: 'there is an error, please try again later.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'there is an error, please try again later.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'email or password is incorrect.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'email or password is incorrect.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'email or password is incorrect.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'please check your internet connection.');
      } else {
        throw CustomException(
            message: 'there is an error, please try again later.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'there is an error, please try again later.');
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
