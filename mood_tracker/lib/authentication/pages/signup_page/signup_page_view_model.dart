import 'package:mood_tracker/authentication/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_page_view_model.g.dart';

@Riverpod()
class SignupPageViewModel extends _$SignupPageViewModel {
  final AuthenticationRepository _repository;

  SignupPageViewModel(this._repository);

  @override
  FutureOr<CreateAccountResultModel> build() {
    return CreateAccountResultModel.empty();
  }

  Future<void> createAccount({required String email, required String password}) async {
    final response = await _repository.createUserWithEmailAndPassword(email: email, password: password);
    state = AsyncData(response);
  }
}
