import 'package:mood_tracker/authentication/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_page_view_model.g.dart';

class LoginPageState {
  final Status status;
  final String? errorMessage;

  LoginPageState._(this.status, this.errorMessage);

  factory LoginPageState.initial() => LoginPageState._(Status.initial, null);
  factory LoginPageState.loading() => LoginPageState._(Status.loading, null);
  factory LoginPageState.success() => LoginPageState._(Status.success, null);
  factory LoginPageState.error(String message) => LoginPageState._(Status.error, message);
}

enum Status { initial, loading, success, error }

@Riverpod()
class LoginPageViewModel extends _$LoginPageViewModel {
  late final AuthenticationRepository _authenticationRepository;

  @override
  LoginPageState build() {
    _authenticationRepository = ref.read(authenticationRepositoryProvider);
    return LoginPageState.initial();
  }

  Future<void> login({required String email, required String password}) async {
    state = LoginPageState.loading();
    final result = await AsyncValue.guard(() async {
      await _authenticationRepository.signInWithEmailAndPassword(email: email, password: password);
    });
    result.when(
      loading: () {},
      data: (_) => state = LoginPageState.success(),
      error: (error, stackTrace) {
        if (error is AuthException) {
          state = LoginPageState.error(error.message);
        } else {
          state = LoginPageState.error(error.toString());
        }
      },
    );
  }

  void resetState() {
    state = LoginPageState.initial();
  }
}
