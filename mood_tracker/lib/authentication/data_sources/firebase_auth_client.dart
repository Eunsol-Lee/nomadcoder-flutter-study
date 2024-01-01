import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_tracker/authentication/index.dart';

class FirebaseAuthClient implements AuthClient {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthClient(this._firebaseAuth);

  @override
  Future<AuthResult> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return AuthResult(
        userId: userCredential.user!.uid, email: userCredential.user!.email!);
  }
}
