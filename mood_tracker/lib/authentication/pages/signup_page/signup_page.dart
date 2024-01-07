import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/authentication/index.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:mood_tracker/shared/index.dart';

import 'signup_page_view_model.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  static const routeName = 'authenticationSignup';
  static const routePath = 'signup';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final attemptedCreateAccountResult = ref.watch(signupPageViewModelProvider);

    if (attemptedCreateAccountResult.status == Status.success) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Signup Success'),
            content: const Text('Successfully created an account'),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref.read(signupPageViewModelProvider.notifier).resetState();
                    context.goNamed(HomeTabPage.routeName);
                  }),
            ],
          ),
        );
      });
    }

    if (attemptedCreateAccountResult.status == Status.error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Signup Error'),
            content: Text(attemptedCreateAccountResult.errorMessage!),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref.read(signupPageViewModelProvider.notifier).resetState();
                  }),
            ],
          ),
        );
      });
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const MtTitle(),
            centerTitle: true,
            toolbarHeight: Sizes.size96,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
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
                  obscureText: true,
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
                    onPressed: () {
                      _createAccount(ref: ref, email: emailController.text, password: passwordController.text);
                    },
                  ),
                ),
                const Spacer(flex: 3),
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
        ),
        if (attemptedCreateAccountResult.status != Status.initial)
          const ModalBarrier(dismissible: false, color: Colors.black45),
      ],
    );
  }

  void _createAccount({required WidgetRef ref, required String email, required String password}) {
    ref.read(signupPageViewModelProvider.notifier).createAccount(email: email, password: password);
  }

  void _goToLoginPage(BuildContext context) {
    context.goNamed(LoginPage.routeName);
  }
}
