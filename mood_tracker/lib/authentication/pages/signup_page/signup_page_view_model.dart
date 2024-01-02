import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/authentication/index.dart';

class AuthenticationViewModel {
  final AuthenticationRepository _repository;

  AuthenticationViewModel(this._repository);

  Future<void> createAccount(
      {required String email, required String password}) async {
    try {
      await _repository.createUserWithEmailAndPassword(
          email: email, password: password);
    } on AuthException catch (e) {
      print(e);
    }
  }
}

final authenticationViewModelProvider = Provider((ref) =>
    AuthenticationViewModel(ref.watch(authenticationRepositoryProvider)));

final createAccountProvider = FutureProvider.family<void, Map<String, String>>(
  (ref, data) async {
    final authViewModel = ref.watch(authenticationViewModelProvider);
    await authViewModel.createAccount(
        email: data['email']!, password: data['password']!);
  },
);
