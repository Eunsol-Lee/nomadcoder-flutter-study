import 'package:mood_tracker/authentication/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository.g.dart';

class AuthenticationRepository {
  final AuthDataSource _authDataSource;

  AuthenticationRepository(this._authDataSource);

  Future<CreateAccountResultModel> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _authDataSource.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<LoginResultModel> signInWithEmailAndPassword({required String email, required String password}) async {
    return await _authDataSource.signInWithEmailAndPassword(email: email, password: password);
  }
}

@Riverpod()
AuthenticationRepository authenticationRepository(AuthenticationRepositoryRef ref) =>
    AuthenticationRepository(ref.watch(autoDataSourceProvider));
