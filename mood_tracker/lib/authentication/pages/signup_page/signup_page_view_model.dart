import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/authentication/index.dart';

class AuthenticationViewModel {
  final AuthenticationRepository _repository;

  AuthenticationViewModel(this._repository);

  Future<void> createAccount(
      {required String email, required String password}) async {
    try {
      await _repository.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}

final authenticationViewModelProvider = Provider((ref) =>
    AuthenticationViewModel(ref.watch(authenticationRepositoryProvider)));
