import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/authentication/index.dart';

abstract class AuthClient {
  Future<AuthResult> createUserWithEmailAndPassword(
      {required String email, required String password});
}

final authClientProvider = Provider<AuthClient>((ref) {
  return AuthClientFactory.createAuthClient();
});
