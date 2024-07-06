import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errMessage);

  factory FirebaseFailure.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'invalid-email':
        return FirebaseFailure('Invalid email address.');
      case 'user-disabled':
        return FirebaseFailure('User has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found for that email.');
      case 'wrong-password':
        return FirebaseFailure('Wrong password provided.');
      case 'email-already-in-use':
        return FirebaseFailure('The email is already in use.');
      case 'operation-not-allowed':
        return FirebaseFailure('Operation not allowed.');
      case 'weak-password':
        return FirebaseFailure('The password is too weak.');
      case 'network-request-failed':
        return FirebaseFailure('Network request failed.');
      default:
        return FirebaseFailure('An unknown error occurred.');
    }
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
