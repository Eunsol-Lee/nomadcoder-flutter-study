import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_tracker/authentication/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_data_source.g.dart';

class FirebaseAuthDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSource(this._firebaseAuth);

  @override
  Future<CreateAccountResultModel> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return CreateAccountResultModel(userId: userCredential.user!.uid, email: userCredential.user!.email!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException(message: 'The account already exists for that email.', code: e.code);
        case 'invalid-email':
          throw AuthException(message: 'The email address is not valid.', code: e.code);
        case 'operation-not-allowed':
          throw AuthException(message: 'Email/password accounts are not enabled.', code: e.code);
        case 'missing-password':
          throw AuthException(message: 'Please enter a password.', code: e.code);
        case 'weak-password':
          throw AuthException(message: 'The password provided is too weak.', code: e.code);
        default:
          throw AuthException(message: 'An unknown error occurred.', code: e.code);
      }
    }
  }

  @override
  Future<LoginResultModel> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return LoginResultModel(userId: userCredential.user!.uid, email: userCredential.user!.email!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email': // The email address is not valid.
        case 'user-disabled': // The user account has been disabled by an administrator.
        case 'user-not-found': // No user found for that email.
        case 'wrong-password': // Wrong password provided for that user.
          // In all of these cases, we want to throw the same exception.
          throw AuthException(message: 'Invalid email or password.', code: e.code);
        default:
          throw AuthException(message: 'An unknown error occurred.', code: e.code);
      }
    }
  }
}

@Riverpod()
AuthDataSource autoDataSource(AutoDataSourceRef ref) => FirebaseAuthDataSource(FirebaseAuth.instance);
