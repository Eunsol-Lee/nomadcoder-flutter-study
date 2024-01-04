import 'package:mood_tracker/authentication/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository.g.dart';

class AuthenticationRepository {
  final AuthDataSource _authClient;

  AuthenticationRepository(this._authClient);

  Future<CreateAccountResultModel> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _authClient.createUserWithEmailAndPassword(email: email, password: password);
  }
}

@Riverpod()
AuthenticationRepository authenticationRepository(AuthenticationRepositoryRef ref) =>
    AuthenticationRepository(ref.watch(autoDataSourceProvider));
