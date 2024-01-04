import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_tracker/authentication/index.dart';

class FirebaseAuthClient implements AuthClient {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthClient(this._firebaseAuth);

  @override
  Future<AuthResult> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthResult(
          userId: userCredential.user!.uid, email: userCredential.user!.email!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException(
              message: 'The account already exists for that email.',
              code: e.code);
        case 'invalid-email':
          throw AuthException(
              message: 'The email address is not valid.', code: e.code);
        case 'operation-not-allowed':
          throw AuthException(
              message: 'Email/password accounts are not enabled.',
              code: e.code);
        case 'missing-password':
          throw AuthException(
              message: 'Please enter a password.', code: e.code);
        case 'weak-password':
          throw AuthException(
              message: 'The password provided is too weak.', code: e.code);
        default:
          throw AuthException(
              message: 'An unknown error occurred.', code: e.code);
      }
    }
  }
}

class AuthClientFactory {
  static AuthClient createAuthClient() {
    return FirebaseAuthClient(FirebaseAuth.instance);
  }
}
