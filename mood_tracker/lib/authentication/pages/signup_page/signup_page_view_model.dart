import 'package:mood_tracker/authentication/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_page_view_model.g.dart';

class SignupPageState {
  final Status status;
  final String? errorMessage;

  SignupPageState._(this.status, this.errorMessage);

  factory SignupPageState.initial() => SignupPageState._(Status.initial, null);
  factory SignupPageState.loading() => SignupPageState._(Status.loading, null);
  factory SignupPageState.success() => SignupPageState._(Status.success, null);
  factory SignupPageState.error(String message) => SignupPageState._(Status.error, message);
}

enum Status { initial, loading, success, error }

@Riverpod()
class SignupPageViewModel extends _$SignupPageViewModel {
  late final AuthenticationRepository _authenticationRepository;

  @override
  SignupPageState build() {
    _authenticationRepository = ref.read(authenticationRepositoryProvider);
    return SignupPageState.initial();
  }

  Future<void> createAccount({required String email, required String password}) async {
    state = SignupPageState.loading();
    final result = await AsyncValue.guard(() async {
      await _authenticationRepository.createUserWithEmailAndPassword(email: email, password: password);
    });
    result.when(
      loading: () {},
      data: (_) => state = SignupPageState.success(),
      error: (error, stackTrace) {
        if (error is AuthException) {
          state = SignupPageState.error(error.message);
        } else {
          state = SignupPageState.error(error.toString());
        }
      },
    );
  }

  void resetState() {
    state = SignupPageState.initial();
  }
}
