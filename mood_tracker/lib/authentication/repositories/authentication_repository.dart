import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/authentication/index.dart';

class AuthenticationRepository {
  final AuthClient _authClient;

  AuthenticationRepository(this._authClient);

  Future<AuthResult> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _authClient.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}

final authenticationRepositoryProvider = Provider((ref) {
  final authClient = ref.watch(authClientProvider);
  return AuthenticationRepository(authClient);
});
