import 'package:mood_tracker/authentication/index.dart';

abstract class AuthDataSource {
  Future<CreateAccountResultModel> createUserWithEmailAndPassword({required String email, required String password});
  Future<CreateAccountResultModel> signInWithEmailAndPassword({required String email, required String password});
}
