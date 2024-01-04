import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/authentication/index.dart';
import 'package:mood_tracker/shared/index.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  static const routeName = 'authenticationSignup';
  static const routePath = 'signup';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const AuthenticationTitle(),
        centerTitle: true,
        toolbarHeight: Sizes.size96,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Join!', style: Theme.of(context).textTheme.titleLarge),
            Gaps.v36,
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            Gaps.v12,
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            Gaps.v12,
            SizedBox(
              width: double.infinity,
              child: MtButton(
                'Create Account',
                onPressed: () =>
                    _createAccount(ref: ref, email: emailController.text, password: passwordController.text),
              ),
            ),
            Gaps.v12,
            Gaps.v96,
            Gaps.v96,
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size60, vertical: Sizes.size24),
        height: Sizes.size96,
        width: double.infinity,
        child: MtButton(
          'Log in',
          onPressed: () => _goToLoginPage(context),
        ),
      ),
    );
  }

  void _createAccount({required WidgetRef ref, required String email, required String password}) {
    final viewModel = ref.watch(authenticationViewModelProvider);
    viewModel.createAccount(email: email, password: password);
  }

  void _goToLoginPage(BuildContext context) {
    context.goNamed(LoginPage.routeName);
  }
}
