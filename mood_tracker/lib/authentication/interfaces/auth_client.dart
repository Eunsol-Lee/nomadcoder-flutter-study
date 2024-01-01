import 'package:mood_tracker/authentication/index.dart';

abstract class AuthClient {
  Future<AuthResult> createUserWithEmailAndPassword(
      {required String email, required String password});
}
